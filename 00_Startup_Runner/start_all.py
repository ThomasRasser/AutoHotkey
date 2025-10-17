import subprocess
import platform
import os

# -------------------------------------------
# To add new scripts into the autostart,
# just add the path to the "scripts_data" array
# -------------------------------------------

# Define keywords for text colorization
green_text = "\033[92m"  # ANSI escape code for green text
red_text = "\033[91m"  # ANSI escape code for red text
reset_text_color = "\033[0m"  # Reset the color

# Make sure it runs on windows and not wsl
if  'wsl2' in platform.uname().release.lower():
    print(f"{red_text}Error: Script started in WSL2 instead of Windows PowerShell{reset_text_color}")
    exit()

# Define the executable paths for AutoHotkey versions
default_ahk_v1_executable = "C:\\Program Files\\AutoHotkey\\AutoHotkeyU64.exe"
default_ahk_v2_executable = "C:\\Users\\thomas\\Software\\AutoHotkey\\AutoHotkey\\AutoHotkey.AutoHotkey\\v2.0.10\\AutoHotkey64.exe"

# Define the script paths and versions
ahk_base_path = "\\\\wsl.localhost\\Ubuntu\\home\\thomas\\desktop\\projects\\1_Programming\\1_Pure_Language\\01_AutoHotkey_AHK\\"
scripts_data = [
    {"path": ahk_base_path + "04_Mail\\mail.ahk", "ahk_version": 1},
    {"path": ahk_base_path + "01_ChangeCase\\changeCase.ahk", "ahk_version": 1},
    {"path": ahk_base_path + "03_Window2Mouse\\window2mouse.ahk", "ahk_version": 1},
    {"path": ahk_base_path + "15_Insert\\insert.ahk", "ahk_version": 1},
    {"path": ahk_base_path + "02_ChangeMonitor\\changeMonitor.ahk", "ahk_version": 1},
    {"path": ahk_base_path + "11_ApplicationSwitcher\\applicationSwitcher.ahk2", "ahk_version": 2},
    {"path": ahk_base_path + "16_SearchInNewTab\\searchInNewTab.ahk", "ahk_version": 2},
    {"path": ahk_base_path + "17_Backticks\\backticks.ahk", "ahk_version": 2},
    {"path": ahk_base_path + "18_ChangeVirtualDesktop\\changeVirtualDesktop.ahk2", "ahk_version": 2},
    {"path": ahk_base_path + "19_FileCreator\\fileCreator.ahk", "ahk_version": 2},
    {"path": ahk_base_path + "20_OpenInTerminal\\openInTerminal.ahk2", "ahk_version": 2},
    # -<>- Add here -<>-
]

def execute_script(script_data):

    # Validate data
    if "path" not in script_data or "ahk_version" not in script_data:
        print(f"{red_text}Error: Invalid script data{reset_text_color}")
        return
    if script_data['ahk_version'] != 1 and script_data['ahk_version'] != 2:
        print(f"{red_text}Error: Invalid AutoHotkey version{reset_text_color}")
        return
    if not os.path.exists(script_data['path']):
        print(f"{red_text}Error: Script file not found{reset_text_color}")
        print(f"{red_text}Path: {script_data['path']}{reset_text_color}")
        return

    # Assign the executable based on the AutoHotkey version
    if script_data['ahk_version'] == 1:
        executable = default_ahk_v1_executable
    elif script_data['ahk_version'] == 2:
        executable = default_ahk_v2_executable
    else:
        print(f"{red_text}Error: Could not start {script_data['path']}{reset_text_color}")
        return

    # Attempt to start the scripts
    process = subprocess.Popen([executable, script_data['path']])
    script_name = script_data['path'].split("\\")[-1]
    print(f"{green_text}Started ahk-v{script_data['ahk_version']} {script_name}{reset_text_color}")

# Example usage
for script_data in scripts_data:
    execute_script(script_data)
