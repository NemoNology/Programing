import random

mark = ["Nissan", "Toyota", "Hyundai", "Honda", "Tesla", "Ford", "ЗИЛ", "КАМАЗ", "Lada"] # Марки машин

let = ["A", "B", "C", "D", "E" "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"]

fam = ["Григорьев", "Гордеев", "Новиков", "Журавлёв", "Лаврентьев", "Киселёв", "Ширяев", "Колобов", "Афанасьев", "Ситников", "Дементьев", "Абрамов", "Игнатов", "Молчанов", "Ефимов",]

#num = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]

n1 = str("")

stop = int(0);

for i in range(72):

    for j in range(3):

        n1 = n1 + str(random.randint(0, 9))

    n1 += random.choice(let) + random.choice(let) + str(random.randint(0, 9))

    print(random.choice(mark), n1, random.choice(fam))

    n1 = ""

input(stop)
