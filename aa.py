
def f(dan):
    for i in range(1,10):
        print (str(dan)+ "x"+str(i)+"="+str(dan*i));

##print (f(3))

def gugudan():
    for dan in range(2,10):
        f(dan)
    return

print (gugudan())
