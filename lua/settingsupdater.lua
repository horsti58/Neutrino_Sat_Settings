--[[ The Tuxbox Copyright
 Copyright 2019 Markus Volk, Horsti58
 Redistribution and use in source and binary forms, with or without modification, 
 are permitted provided that the following conditions are met:
 Redistributions of source code must retain the above copyright notice, this list
 of conditions and the following disclaimer. Redistributions in binary form must
 reproduce the above copyright notice, this list of conditions and the following
 disclaimer in the documentation and/or other materials provided with the distribution.
 THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS ``AS IS`` AND ANY EXPRESS OR IMPLIED
 WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY
 AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
 HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
 EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
 SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
 HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
 OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
 SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 The views and conclusions contained in the software and documentation are those of the
 authors and should not be interpreted as representing official policies, either expressed
 or implied, of the Tuxbox Project.]]

caption = "Settings Updater"

locale = {}
locale["deutsch"] = {
fetch_source = "Die aktuellen Senderlisten werden geladen",
fetch_failed = "Download fehlgeschlagen",
write_settings = "Die ausgewählten Senderlisten werden geschrieben",
cleanup = "Temporäre Dateien werden gelöscht",
cleanup_failed = "Temporäre Dateien konnten nicht entfernt werden",
menu_options = "Einstellungen",
menu_update = "Update starten",
yes = "ja",
no = "nein",
cfg_install_a = "Senderliste ",
cfg_install_b = " installieren",
cfg_ubouquets = "uBouquets installieren",
cfg_git = "Git für den Download verwenden",
last_update = "Letztes Update: "
}
locale["english"] = {
fetch_source = "The latest settings are getting downloaded",
fetch_failed = "Download failed",
write_settings = "Writing the selected settings  to its destination",
cleanup = "Cleanup temporary files",
cleanup_failed = "Cleanup data failed",
menu_options = "Options",
menu_update = "Start update",
yes = "yes",
no = "no",
cfg_install_a = "Install ",
cfg_install_b = " settings",    
cfg_ubouquets = "Install ubouqets",
cfg_git = "Use git for downloading",
last_update = "Last update: "
}

n = neutrino()
tmp = "/tmp/settingupdate"
neutrino_conf_base = "/var/tuxbox/config"
icondir = "/share/tuxbox/neutrino/icons"
neutrino_conf = neutrino_conf_base .. "/neutrino.conf" 
zapitdir = neutrino_conf_base .. "/zapit"
setting_intro = tmp .. "/lua"
settingupdater_cfg = neutrino_conf_base .. "/settingupdater.cfg"

function exists(file)
	local ok, err, exitcode = os.rename(file, file)
	if not ok then
		if exitcode == 13 then
		-- Permission denied, but it exists
		return true
		end
	end
	return ok, err
end

function isdir(path)
	return exists(path .. "/")
end

function create_settingupdater_cfg()
	file = io.open(settingupdater_cfg, "w")
	file:write("28.2E=0", "\n")
	file:write("26.0E=0", "\n")
	file:write("23.5E=0", "\n")
	file:write("19.2E=1", "\n")
	file:write("16.0E=0", "\n")
	file:write("13.0E=0", "\n")
	file:write("9.0E=0", "\n")
	file:write("7.0E=0", "\n")
	file:write("4.8E=0", "\n")
	file:write("0.8W=0", "\n")
	file:write("use_git=0", "\n")
	file:close()
end

function get_modify_time(file)
	local file = io.popen("stat -c %Y " .. file)
	local last_modified = file:read()
	return last_modified
end

function show_modify_time(file)
	modify_time = os.date("%c", get_modify_time(file))
	return modify_time
end

if (exists(settingupdater_cfg) ~= true) then
	create_settingupdater_cfg()
end

function get_cfg_value(str)
	for line in io.lines(settingupdater_cfg) do
		if line:match(str .. "=") then
			local i,j = string.find(line, str .. "=")
			r = tonumber(string.sub(line, j+1, #line))
		end
	end
	return r
end

if (get_cfg_value("use_git") == 1) then
	setting_url = "https://github.com/horsti58/Neutrino_Sat_Settings"
else
	setting_url = "https://codeload.github.com/horsti58/Neutrino_Sat_Settings/zip/master"
end

function nconf_value(str)
	for line in io.lines(neutrino_conf) do
		if line:match(str .. "=") then
			local i,j = string.find(line, str .. "=")
			value = string.sub(line, j+1, #line)
		end
	end
	return value
end

lang = nconf_value("language")
if locale[lang] == nil then
	lang = "english"
end

timing_menu = nconf_value("timing.menu")

function sleep(a) 
	local sec = tonumber(os.clock() + a); 
	while (os.clock() < sec) do 
	end 
end

function show_error(msg)
	ret = hintbox.new { title = caption, icon = "settings", text = msg };
	ret:paint();
	sleep(3);
	ret:hide();
end

function start_update()
	chooser:hide()
	if (isdir(tmp) == true) then os.execute("rm -rf " .. tmp) end
	local ret = hintbox.new { title = caption, icon = "settings", text = locale[lang].fetch_source };
	ret:paint();
	if (get_cfg_value("use_git") == 1) then 
		ok ,err, exitcode = os.execute("git clone " .. setting_url .. " " .. tmp)
	else
		ok ,err, exitcode = os.execute("curl " .. setting_url .. " -o " .. tmp .. ".zip")
		if (exists(tmp) ~= true) then
			os.execute("mkdir " .. tmp)
		end
		os.execute("unzip -x " .. tmp .. ".zip -d " .. tmp)
		local glob = require "posix".glob
		for _, j in pairs(glob(tmp .. "/*", 0)) do
			os.execute("mv -f " .. j .. "/* " .. tmp)
		end
		os.execute("rm -rf " .. tmp .. ".zip")
	end

	if (exitcode ~= 0) then
		ret:hide()
		show_error(locale[lang].fetch_failed)
		return
	else
		ret:hide();
	end
	local ok,err,exitcode = os.execute("rsync -rlpgoD --size-only " .. setting_intro .. "/settingupdater_" .. nconf_value("osd_resolution") .. ".png " .. icondir .. "/settingupdater.png")
	if (exitcode ~= 0) then
		ret:hide()
		print("rsync missing?")
	else
		ret:hide();
	end	
	local ret = hintbox.new { title = caption, icon = "settings", text = locale[lang].write_settings};
	ret:paint();
	local positions ={}
	table.insert (positions, "start")
	if (get_cfg_value("28.2E") == 1) then table.insert (positions, "28.2E") end
	if (get_cfg_value("26.0E") == 1) then table.insert (positions, "26.0E") end
	if (get_cfg_value("23.5E") == 1) then table.insert (positions, "23.5E") end
	if (get_cfg_value("19.2E") == 1) then table.insert (positions, "19.2E") end
	if (get_cfg_value("16.0E") == 1) then table.insert (positions, "16.0E") end
	if (get_cfg_value("13.0E") == 1) then table.insert (positions, "13.0E") end
	if (get_cfg_value("9.0E") == 1) then table.insert (positions, "9.0E") end
	if (get_cfg_value("7.0E") == 1) then table.insert (positions, "7.0E") end
	if (get_cfg_value("4.8E") == 1) then table.insert (positions, "4.8E") end
	if (get_cfg_value("0.8W") == 1) then table.insert (positions, "0.8W") end
	table.insert (positions, "end")

	bouquets = io.open(zapitdir .. "/bouquets.xml", 'w')
	for i, v in ipairs(positions) do
		for line in io.lines(tmp .. "/data/" .. v .. "/bouquets.xml") do
			bouquets:write(line, "\n")
		end
	end

	services = io.open(zapitdir .. "/services.xml", 'w')
	for i, v in ipairs(positions) do
		for line in io.lines(tmp .. "/data/" .. v .. "/services.xml") do
			services:write(line, "\n")
		end
	end

	satellites = io.open(neutrino_conf_base .. "/satellites.xml", 'w')
	for i, v in ipairs(positions) do
		for line in io.lines(tmp .. "/data/" .. v .. "/satellites.xml") do
			satellites:write(line, "\n")
		end
	end
	bouquets:close()
	services:close()
	satellites:close()
	os.execute("pzapit -c ")
	sleep(1)
	ret:hide()
	local ret = hintbox.new { title = caption, icon = "settings", text = locale[lang].cleanup };
	ret:paint()
	local ok,err,exitcode = os.execute("rm -r " .. tmp)
	sleep(1);
	if (exitcode ~= 0) then
		ret:hide()
		show_error(locale[lang].cleanup_failed)
		return
	else
		ret:hide()
	end	
end

function write_cfg(k, v, str)
	if (v == locale[lang].yes) then a = 1 else a = 0 end
	local cfg_content = {}
	for line in io.lines(settingupdater_cfg) do
		if line:match(str .. "=") then
			nline = string.reverse(string.gsub(string.reverse(line), string.sub(string.reverse(line), 1, 1), a, 1))
			table.insert (cfg_content, nline)
		else
			table.insert (cfg_content, line)
		end
	end
	file = io.open(settingupdater_cfg, 'w')
	for i, v in ipairs(cfg_content) do
		file:write(v, "\n")
	end
	io.close(file)
	end

function astra_gb_cfg(k, v, str) 
	write_cfg(k, v, "28.2E")
end

function badr_cfg(k, v, str) 
	write_cfg(k, v, "26.0E")
end

function astra_nl_cfg(k, v, str) 
	write_cfg(k, v, "23.5E")
end

function astra_cfg(k, v, str)
	write_cfg(k, v, "19.2E")
end

function eutelsatc_cfg(k, v, str) 
	write_cfg(k, v, "16.0E")
end

function hotbird_cfg(k, v, str) 
	write_cfg(k, v, "13.0E")
end

function eutelsata_cfg(k, v, str) 
	write_cfg(k, v, "9.0E")
end

function eutelsatb_cfg(k, v, str) 
	write_cfg(k, v, "7.0E")
end

function astraa_cfg(k, v, str) 
	write_cfg(k, v, "4.8E")
end

function thor_cfg(k, v, str) 
	write_cfg(k, v, "0.8W")
end

function use_git_cfg(k, v, str) 
	write_cfg(k, v, "use_git")
end

function options ()
	chooser:hide()
	menu = menu.new{name=locale[lang].menu_options}
	menu:addItem{type="back"}
	menu:addItem{type="separatorline"}
	opt = {locale[lang].yes ,locale[lang].no}	
	if (get_cfg_value("19.2E") == 1) then
		menu:addItem{type="chooser", action="astra_cfg", options={opt[1], opt[2]}, id="ID2", value="download", icon=2, name=locale[lang].cfg_install_a .. " 19.2E " .. locale[lang].cfg_install_b}
	elseif (get_cfg_value("19.2E") == 0) then
		menu:addItem{type="chooser", action="astra_cfg", options={opt[2], opt[1]}, id="ID2", value="download", icon=2, name=locale[lang].cfg_install_a .. " 19.2E " .. locale[lang].cfg_install_b}
	end
	if (get_cfg_value("13.0E") == 1) then
	menu:addItem{type="chooser", action="hotbird_cfg", options={opt[1], opt[2]}, id="ID3", value="download", icon=3, name=locale[lang].cfg_install_a .. " 13.0E " .. locale[lang].cfg_install_b}
	elseif (get_cfg_value("13.0E") == 0) then
		menu:addItem{type="chooser", action="hotbird_cfg", options={opt[2], opt[1]}, id="ID3", value="download", icon=3, name=locale[lang].cfg_install_a .. " 13.0E " .. locale[lang].cfg_install_b}
	end
	if (get_cfg_value("16.0E") == 1) then
	menu:addItem{type="chooser", action="eutelsatc_cfg", options={opt[1], opt[2]}, id="ID4", value="download", icon=4, name=locale[lang].cfg_install_a .. " 16.0E " .. locale[lang].cfg_install_b}
	elseif (get_cfg_value("16.0E") == 0) then
		menu:addItem{type="chooser", action="eutelsatc_cfg", options={opt[2], opt[1]}, id="ID4", value="download", icon=4, name=locale[lang].cfg_install_a .. " 16.0E " .. locale[lang].cfg_install_b}
	end
	if (get_cfg_value("23.5E") == 1) then
		menu:addItem{type="chooser", action="astra_nl_cfg", options={opt[1], opt[2]}, id="ID5", value="download", icon=5, name=locale[lang].cfg_install_a .. " 23.5E " .. locale[lang].cfg_install_b}
	elseif (get_cfg_value("23.5E") == 0) then
		menu:addItem{type="chooser", action="astra_nl_cfg", options={opt[2], opt[1]}, id="ID5", value="download", icon=5, name=locale[lang].cfg_install_a .. " 23.5E " .. locale[lang].cfg_install_b}
	end
	if (get_cfg_value("26.0E") == 1) then
		menu:addItem{type="chooser", action="badr_cfg", options={opt[1], opt[2]}, id="ID6", value="download", icon=6, name=locale[lang].cfg_install_a .. " 26.0E " .. locale[lang].cfg_install_b}
	elseif (get_cfg_value("26.0E") == 0) then
		menu:addItem{type="chooser", action="badr_cfg", options={opt[2], opt[1]}, id="ID6", value="download", icon=6, name=locale[lang].cfg_install_a .. " 26.0E " .. locale[lang].cfg_install_b}
	end
	if (get_cfg_value("28.2E") == 1) then
		menu:addItem{type="chooser", action="astra_gb_cfg", options={opt[1], opt[2]}, id="ID7", value="download", icon=7, name=locale[lang].cfg_install_a .. " 28.2E " .. locale[lang].cfg_install_b}
	elseif (get_cfg_value("28.2E") == 0) then
		menu:addItem{type="chooser", action="astra_gb_cfg", options={opt[2], opt[1]}, id="ID7", value="download", icon=7, name=locale[lang].cfg_install_a .. " 28.2E " .. locale[lang].cfg_install_b}
	end
	if (get_cfg_value("9.0E") == 1) then
	menu:addItem{type="chooser", action="eutelsata_cfg", options={opt[1], opt[2]}, id="ID8", value="download", icon=8, name=locale[lang].cfg_install_a .. " 9.0E " .. locale[lang].cfg_install_b}
	elseif (get_cfg_value("9.0E") == 0) then
		menu:addItem{type="chooser", action="eutelsata_cfg", options={opt[2], opt[1]}, id="ID8", value="download", icon=8, name=locale[lang].cfg_install_a .. " 9.0E " .. locale[lang].cfg_install_b}
	end
	if (get_cfg_value("7.0E") == 1) then
	menu:addItem{type="chooser", action="eutelsatb_cfg", options={opt[1], opt[2]}, id="ID9", value="download", icon=9, name=locale[lang].cfg_install_a .. " 7.0E " .. locale[lang].cfg_install_b}
	elseif (get_cfg_value("7.0E") == 0) then
		menu:addItem{type="chooser", action="eutelsatb_cfg", options={opt[2], opt[1]}, id="ID9", value="download", icon=9, name=locale[lang].cfg_install_a .. " 7.0E " .. locale[lang].cfg_install_b}
	end
	if (get_cfg_value("4.8E") == 1) then
	menu:addItem{type="chooser", action="astraa_cfg", options={opt[1], opt[2]}, id="ID10", value="download", icon=10, name=locale[lang].cfg_install_a .. " 4.8E " .. locale[lang].cfg_install_b}
	elseif (get_cfg_value("4.8E") == 0) then
		menu:addItem{type="chooser", action="astraa_cfg", options={opt[2], opt[1]}, id="ID10", value="download", icon=10, name=locale[lang].cfg_install_a .. " 4.8E " .. locale[lang].cfg_install_b}
	end
	if (get_cfg_value("0.8W") == 1) then
	menu:addItem{type="chooser", action="thor_cfg", options={opt[1], opt[2]}, id="ID11", value="download", icon=11, name=locale[lang].cfg_install_a .. " 0.8E " .. locale[lang].cfg_install_b}
	elseif (get_cfg_value("0.8W") == 0) then
		menu:addItem{type="chooser", action="thor_cfg", options={opt[2], opt[1]}, id="ID11", value="download", icon=11, name=locale[lang].cfg_install_a .. " 0.8E " .. locale[lang].cfg_install_b}
	end
	if (get_cfg_value("use_git") == 1) then
		menu:addItem{type="chooser", action="use_git_cfg", options={opt[1], opt[2]}, id="ID0", value="download", icon=0, name=locale[lang].cfg_git}
	elseif (get_cfg_value("use_git") == 0) then
		menu:addItem{type="chooser", action="use_git_cfg", options={opt[2], opt[1]}, id="ID0", value="download", icon=0, name=locale[lang].cfg_git}
	end
	menu:exec()
	main()
end

function main()
	chooser_dx = n:scale2Res(560)
	chooser_dy = n:scale2Res(350)
	chooser_x = SCREEN.OFF_X + (((SCREEN.END_X - SCREEN.OFF_X) - chooser_dx) / 2)
	chooser_y = SCREEN.OFF_Y + (((SCREEN.END_Y - SCREEN.OFF_Y) - chooser_dy) / 2)

	chooser = cwindow.new {
	caption = locale[lang].last_update .. show_modify_time(zapitdir .. "/bouquets.xml"),
	x = chooser_x,
	y = chooser_y,
	dx = chooser_dx,
	dy = chooser_dy,
	icon = "settings",
	has_shadow = true,
	btnGreen = locale[lang].menu_update,
	btnRed = locale[lang].menu_options
	}
	picture = cpicture.new {
	parent = chooser,
	image="settingupdater",
	}
	chooser:paint()
	i = 0
	d = 500 -- ms
	t = (timing_menu * 1000) / d
	if t == 0 then
		t = -1 -- no timeout
	end
	colorkey = nil
	repeat
		i = i + 1
		msg, data = n:GetInput(d)
		if (msg == RC['red']) then
			options()
			colorkey = true
		elseif (msg == RC['green']) then
			start_update()
			colorkey = true
		end
	until msg == RC['home'] or colorkey or i == t
	chooser:hide()
end

main()
