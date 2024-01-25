from flask import Flask, request, jsonify

from main import gemini_response_model
app = Flask(__name__)


@app.route("/")
def hello_world():
    return {
        "message": "Hello!, Welcome to Healix Model API"
    }

@app.route("/response")
def response():
    data = request.json
    if data and "message" in data:
        message = data["message"]
        return jsonify({"message": gemini_response_model(message)})
    else:
        return jsonify({"error": "Invalid or missing 'message' parameter"}), 400 

if __name__ == "__main__":
    app.run(debug=True)
