def makeMeAPrettyPicture(size):
    prefix = ""
    stars = ""
    spaces = ""
    
    for i in range(size):
        if (size-i) % 2 == 0:
            prefix = "$"
        else:
            prefix = "^"

        for _ in range(size-i):
            stars += "*"
        for _ in range(size - len(stars)):
            spaces += " "

        print(f"{prefix}{spaces}{stars}||xx||")
        stars = ""
        spaces = ""

makeMeAPrettyPicture(100)