Computer Organization - Spring 2024
==============================================================
## Iran Univeristy of Science and Technology
## Assignment 1: Assembly code execution on phoeniX RISC-V core

- Name:Mohammad Mohammad Mahdi Masoumi
- Team Members: Sadegh Aghasi
- Student ID: 400413314
- Date:5/22/2024

https://github.com/M-Mahdi-M1381/phoeniX_MMM

## Report
Square Root:
In this section, an input number with the value 144 is defined, for which the program will calculate the integer square root.
First, the address of the number n is loaded into register x4, and then the value is loaded from memory.
Initial values for the binary search are set: lo in register x5 is set to 0 and hi in register x6 is set to the value of n.
The value mid is calculated as the average of lo and hi. Here, x7 holds the value of mid.
If mid^2 is equal to n, the exact square root is found, and the program jumps to the done section.
If mid^2 is less than n, lo should be set to mid + 1
If mid^2 is greater than n, hi should be set to mid - 1, then jump to check_lo.
Adjusting lo
lo is incremented to mid + 1.
Checking if the Binary Search Should Continue
If lo is less than or equal to hi, the search continues, and the program jumps back to binary_search.
Finding the Nearest Integer
If lo is greater than hi, the nearest integer whose square is less than or equal to n is found and stored in x9.
Ending the Program
The program ends with an exit system call.


Summary:
This program calculates the integer square root of a given number using binary search. The input value is defined in the data section, and the program uses a loop to perform binary search, comparing the square of the middle value with the input number to find the nearest integer square root.

<picture>
    <source media="(prefers-color-scheme: dark)" srcset="https://github.com/M-Mahdi-M1381/phoeniX_MMM/blob/main/Documents/Images/squareroot.png" width="530" height="150" style="vertical-align:middle">
    <img alt="logo in light mode and dark mode" src="https://github.com/M-Mahdi-M1381/phoeniX_MMM/blob/main/Documents/Images/squareroot.png" width="530" height="150" style="vertical-align:middle">
</picture> 



















Quick Sort :
Main Program Initialization
1. Stack Pointer Adjustment: The stack pointer (sp) is incremented by 1000 to allocate space on the stack.
2. Array Initialization: The array elements are initialized in memory starting from the address in a0.
3. Setting Up Start and End Indices: Registers a1 and a2 are set to represent the start (0) and end (6) indices of the array.
4. Calling QuickSort: The QUICKSORT function is called to sort the array.
5. Exiting the Program: After QuickSort completes, the program jumps to the EXIT routine to halt execution.
QuickSort Function
1. Saving Registers: The function saves the return address (ra) and other used registers on the stack.
2. Setting Up Arguments: The starting (s0), low (s1), and high (s2) indices of the array are set from a0, a1, and a2 respectively.
3. Base Case Check: If start is not less than end, the function returns.
4. Partitioning: The PARTITION function is called to partition the array.
5. Recursive Calls:
* QuickSort is called recursively on the subarray before the pivot index.
* QuickSort is called recursively on the subarray after the pivot index.
6. Restoring Registers: Registers are restored from the stack before returning to the caller.
Partition Function
1. Saving Return Address: The return address is saved on the stack.
2. Setting Pivot: The pivot element is selected from the end of the array.
3. Partitioning Loop: The loop iterates through the array, comparing each element with the pivot and swapping elements as necessary.
4. Final Swap: After partitioning, the pivot is placed in its correct position.
5. Returning Pivot Index: The function returns the index of the pivot element after partitioning
Program Termination: The program execution is halted using the ebreak instruction.

Summary

This RISC-V assembly program sorts an array using the QuickSort algorithm. It initializes the array, calls the QuickSort function, and uses a partition function to divide the array around a pivot element. Recursive calls sort the subarrays until the entire array is sorted. The program then terminates with an ebreak instruction.


<picture>
    <source media="(prefers-color-scheme: dark)" srcset="https://github.com/M-Mahdi-M1381/phoeniX_MMM/blob/main/Documents/Images/quicksort.png" width="530" height="150" style="vertical-align:middle">
</picture> 





Good luck
