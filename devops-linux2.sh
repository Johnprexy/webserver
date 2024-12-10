# #!/bin/bash

# echo "Welcome to my mini Arithmetic Calculator"

# read -p "Enter your name: " name
# echo "Welcome $name!"

# # Function to perform the arithmetic operation
# perform_operation() {
#     input="$1"

#     # Debug: Print raw input
#     echo "DEBUG: Raw input is '$input'"

#     # Regex to match an arithmetic operation (e.g., 2+3)
#     if [[ "$input" =~ ^([0-9]+)([+\-*/])([0-9]+)$ ]]; then
#         num1="${BASH_REMATCH[1]}"
#         operator="${BASH_REMATCH[2]}"
#         num2="${BASH_REMATCH[3]}"

#         # Debug: Print parsed components
#         echo "DEBUG: num1=$num1, operator=$operator, num2=$num2"

#         case "$operator" in
#             "+")
#                 answer=$((num1 + num2))
#                 echo "The result of $num1 + $num2 is: $answer"
#                 ;;
#             "-")
#                 answer=$((num1 - num2))
#                 echo "The result of $num1 - $num2 is: $answer"
#                 ;;
#             "*")
#                 answer=$((num1 * num2))
#                 echo "The result of $num1 * $num2 is: $answer"
#                 ;;
#             "/")
#                 if [[ "$num2" -eq 0 ]]; then
#                     echo "Error: Division by zero is not allowed."
#                 else
#                     answer=$((num1 / num2))
#                     echo "The result of $num1 / $num2 is: $answer"
#                 fi
#                 ;;
#             *)
#                 echo "Invalid operator. Please try again."
#                 return 1
#                 ;;
#         esac
#     else
#         echo "Invalid input. Please enter a valid arithmetic operation (e.g., 2+3)."
#         return 1
#     fi
# }

# # Prompt user for arithmetic operation
# read -p "Please enter the arithmetic operation you would like to perform (e.g., 2+3): " operation
# perform_operation "$operation"


#!/bin/bash

# echo "Welcome to my mini Arithmetic Calculator"

# read -p "Enter your name: " name
# read -p "Welcome $name, Please enter the arithmetic operation you would love to perform (e.g., 2+3): " operation

# regex="([+-/*])"

# let answer

# addition() {
#     answer=$((${operator[0]} + ${operator[1]}))
#     echo "The answer is: $answer"
# }

# subtraction() {
#     answer=$((${operator[0]} - ${operator[1]}))
#     echo "The answer is: $answer"
# }

# multiplication() {
#     answer=$((${operator[0]} * ${operator[1]}))
#     echo "The answer is: $answer"
# }

# division() {
#     if [[ "${operator[1]}" -eq 0 ]]; then
#         echo "Error: Division by zero is not allowed."
#     else
#         answer=$((${operator[0]} / ${operator[1]}))
#         echo "The answer is: $answer"
#     fi
# }

# while true; do

#     if [[ $operation =~ $regex ]]; then
#         operand="${BASH_REMATCH[1]}"
#         operator=($(echo $operation | tr "$operand" "\n"))

#         case "$operand" in
#             "+")
#                 read -p "You'd love to perform addition, right? " confirm_operation
#                 if [[ "$confirm_operation" == "yes" ]]; then
#                     addition
#                     exit
#                 else
#                     read -p "Hello $name, Please enter the arithmetic operation you would love to perform: " operation
#                 fi
#                 ;;
#             "-")
#                 read -p "You'd love to perform subtraction, right? " confirm_operation
#                 if [[ "$confirm_operation" == "yes" ]]; then
#                     subtraction
#                     exit
#                 else
#                     read -p "Hello $name, Please enter the arithmetic operation you would love to perform: " operation
#                 fi
#                 ;;
#             "*")
#                 read -p "You'd love to perform multiplication, right? " confirm_operation
#                 if [[ "$confirm_operation" == "yes" ]]; then
#                     multiplication
#                     exit
#                 else
#                     read -p "Hello $name, Please enter the arithmetic operation you would love to perform: " operation
#                 fi
#                 ;;
#             "/")
#                 read -p "You'd love to perform division, right? " confirm_operation
#                 if [[ "$confirm_operation" == "yes" ]]; then
#                     division
#                     exit
#                 else
#                     read -p "Hello $name, Please enter the arithmetic operation you would love to perform: " operation
#                 fi
#                 ;;
#             *)
#                 echo "Invalid operator. Please try again."
#                 read -p "Hello $name, Please enter the arithmetic operation you would love to perform: " operation
#                 ;;
#         esac
#     else
#         echo "Invalid input. Please enter a valid arithmetic operation (e.g., 1+3)."
#         read -p "Hello $name, Please enter the arithmetic operation you would love to perform: " operation
#     fi
# done


#!/bin/bash

echo "What is your name?"
read name

while true; do
    echo "Hello, $name! You are welcome! Please enter the arithmetic operation you'd love to carry out (e.g., 2x2, 2*2, 7/2, or 2+2):"
    read input

    # Use regex to validate and parse the input
    [[ "$input" =~ ^([0-9]+)([x*/+-])([0-9]+)$ ]] && num1="${BASH_REMATCH[1]}" operator="${BASH_REMATCH[2]}" num2="${BASH_REMATCH[3]}"

    case "$operator" in
        x) 
            operator="*"
            ;;
        +|*|/)
            ;; 
        -) 
            ;; 
        *)
            echo "This doesn't look like a valid arithmetic operation. Let's try again!"
            continue
            ;;
    esac

    echo "$name, You want to perform an arithmetic operation, right? (yes/no)"
    read confirmation

    case "$confirmation" in
        yes|Yes)
            case "$operator" in
                "/")
                    if [[ "$num2" == "0" ]]; then
                        echo "Error: Division by zero is not allowed!"
                        continue
                    fi
                    result=$(echo "scale=2; $num1 / $num2" | bc)
                    ;;
                *)
                    result=$(echo "$num1 $operator $num2" | bc)
                    ;;
            esac
            echo "The result of $num1 $operator $num2 is: $result"
            break
            ;;
        no|No)
            echo "Let's try again!"
            ;;
        *)
            echo "Please answer with 'yes' or 'no'."
            ;;
    esac
done
