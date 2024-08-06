#!/bin/bash

# Specify the number of loops
numberOfLoops=10000

# Use a for loop to execute a specified number of times
for ((i=1; i<=numberOfLoops; i++))
do
    echo "This is the ${i}th loop"

    # Run yarn command
    ore  --rpc https://mainnet.helius-rpc.com/?api-key=e25b1bbd-1eaf-4141-8a06-9db33d1250c5 --keypair ~/.config/solana/id.json  --priority-fee 25000000 mine --threads 4

    # Check whether the command was executed successfully
    if [ $? -ne 0 ]; then
        echo "Command execution failed, try to run again..."
    else
        echo "The command was executed successfully and is ready for the next cycle..."
    fi

    # Wait for some time (optional)
    sleep 5
done

echo "loop completed"
