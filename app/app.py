from flask import Flask, render_template
import os

app = Flask(__name__)

@app.route("/")
def display_environment_variable():
    # Read the environment variables
    data = {
        "pod_name": os.environ.get("HOSTNAME", ""),
        "node_name":  os.environ.get("NODE_NAME", ""),
        "pod_namespace": os.environ.get("POD_NAMESPACE", ""),
        "pod_ip_address": os.environ.get("POD_IP_ADDRESS", ""),
    }
    # Render the HTML template and pass the variables to it
    return render_template("index.html", data=data)


if __name__ == "__main__":
    app.run(debug=True)
