import subprocess

def kill_autohotkey_processes():
    try:
        # Find processes that start with AutoHotkey
        result = subprocess.run(["tasklist"], capture_output=True, text=True)
        if "AutoHotkey" in result.stdout:
            # Kill processes
            subprocess.run(["taskkill", "/F", "/IM", "AutoHotkey*"], capture_output=True)
            print("All running AutoHotkey scripts have been terminated.")
        else:
            print("No running AutoHotkey scripts found.")
    except Exception as e:
        print(f"An error occurred: {e}")

kill_autohotkey_processes()