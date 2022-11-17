def calculateDesktopProductID(productID):
    a = ['a','e','i','o','u','A','E','I','O','U']
    s = 0
    for i in productID:
        if i not in a:
            s+=1
    return s

print(calculateDesktopProductID("ejsdnfjsdn"))