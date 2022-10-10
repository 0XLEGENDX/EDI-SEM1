for i in range(int(input("Enter the test cases : "))):

    s = input("Enter the string : ")
    s = s.split()
    for i in s:
        print(len(i),end=",")