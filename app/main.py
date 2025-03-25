from flask import Flask, jsonify, send_from_directory

app = Flask(__name__)

@app.route('/health', methods=['GET'])
def health_check():
    """
    Health check endpoint to verify the service is running.
    Returns a 200 OK response with a status message.
    """
    return jsonify({
        'status': 'healthy',
        'message': 'Service is running'
    }), 200

@app.route('/', methods=['GET'])
def home():
    """
    Root endpoint that returns a welcome message.
    """
    return send_from_directory('/usr/share/html', 'index.html')

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=80, debug=False)
