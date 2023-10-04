import subprocess
import threading

def run_novnc():
    subprocess.run(["novnc_proxy", "--vnc", "localhost:5900"], cwd="/Users/Shared/noVNC/utils/")
def run_ngrok():
    subprocess.run(["ngrok", "http", "6080"])

if __name__ == "__main__":
    novnc_thread = threading.Thread(target=run_novnc)
    novnc_thread.start()

    ngrok_thread = threading.Thread(target=run_ngrok)
    ngrok_thread.start()

    novnc_thread.join()
    ngrok_thread.join()
