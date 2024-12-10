echo "What is your name?"
read name

while true; do
    echo "Hello, $name! You are welcome!, Please enter the arithmetic operation you'd love to carry out (2x2, 2*2, 7/2 or 2+2):"
    read input
    if [[ "$input" == *"x"* || "$input" == *"*"* || "$input" == *"+"* || "$input" == *"-"* || "$input" == *"/"* ]]; then
        echo "$name, You want to perform an arithmetic operation right? (yes/no)"
        read confirmation

        if [[ "$confirmation" == "Yes" || "$confirmation" == "yes" ]]; then
            
            #for Multiplication
            if [[ "$input" == *"x"* ]]; then 
                input=$(echo "$input" | sed 's/x/*/g')
            fi

            # Division

            if [[ "$input" == *"/"* ]]; then 
                divisor=$(echo "$input" | cut -d'/' -f2)
                if [[ "$divisor" == "0" ]]; then
                    echo "Error: Division by zero is not allowed!"
                    continue
                fi
                result=$(echo "scale=2; $input" | sed 's/x/*/g' | bc)
            else
                result=$(echo "$input" | sed 's/x/*/g' | bc)
            
            fi    
            echo "The result of $input is: $result"
            break
        elif [[ "$confirmation" == "No" || "$confirmation" == "no" ]]; then
            echo "let's try again!"
        else
            echo "please answer with 'yes' or 'no'"
        fi
    else
        echo "This doesn't look like a valid arithmetic operation, let try again!"
    fi
done