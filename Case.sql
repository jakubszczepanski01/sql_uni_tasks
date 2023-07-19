Zad1. Wyświetl wszystkie produkty i podaj przy nich informację czy trzeba zamówić dodatkowe produkty ze względu na braki w magazynie w stosunku do
wymaganej minimalnej liczby produktów w magazynie oraz podaj liczby tych produktów (jako wartości dodatnie).

Wyświetl  kolumny:
1) nazwa produktu
2) stan zamówienia (dwie wartości: trzeba zamówić, wystarczająca ilość),
3) liczba produktów (ile produktów brakuje, ile produktów jest w nadmiarze - jako liczby dodatnie)

select ProductName, 
case 
when ReorderLevel = UnitsInStock then 'wystarczająca ilość'
when ReorderLevel > UnitsInStock then 'wystarczająca ilość'
when ReorderLevel < UnitsInStock then 'trzeba zamówić'
end as 'stan zamówienia', 
case
when ReorderLevel = UnitsInStock then ReorderLevel - UnitsInStock
when ReorderLevel > UnitsInStock then ReorderLevel - UnitsInStock
when ReorderLevel < UnitsInStock then UnitsInStock - ReorderLevel 
end as 'liczba produktów'
from Products