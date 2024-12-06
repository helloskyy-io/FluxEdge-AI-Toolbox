# Use the official Ubuntu base image
FROM ubuntu:latest

# Update the container and install sysbench
RUN apt update && \
    apt upgrade -y && \
    apt install -y sysbench

# Set the working directory
WORKDIR /root

# Create a script to run all sysbench tests
RUN echo '#!/bin/bash\n\
sysbench cpu --cpu-max-prime=20000 run > /root/cpu-test-results.txt\n\
sysbench memory --memory-block-size=1M --memory-total-size=10G run > /root/memory-test-read-results.txt\n\
sysbench memory --memory-block-size=1M --memory-total-size=10G --memory-oper=write run > /root/memory-test-write-results.txt' > /root/run-sysbench-tests.sh

# Make the script executable
RUN chmod +x /root/run-sysbench-tests.sh

# Run the script when the container starts
CMD ["/bin/bash", "/root/run-sysbench-tests.sh"]
