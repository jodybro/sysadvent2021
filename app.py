# Standand library imports
import time
import os



# Import the prometheus sdk
import prometheus_client as prom

VERSION = os.getenv('VERSION')
APP = os.getenv('APP')
BRANCH = os.getenv('BRANCH')


if __name__ == '__main__':
    # Example usage of a Gauge
    # WARNING: Labels with high levels of cardinality are not recommended. This is just an example usage.
    example_gauge = prom.Gauge(
        'example_gauge_metric', 'Example metric with custom labels', ["version", "app", "branch"]
    )

    # Start the http server
    prom.start_http_server(8000)

    while True:
        # Set the value of the Gague to 1 (as it always needs a float value)
        # Also set the value of the labels to environment variables 
        example_gauge.labels(version=VERSION, app=APP, branch=BRANCH)
        time.sleep(1)