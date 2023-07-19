Zad1. Podaj klientów (z nazwy), którzy w 1996 roku złożyli przynajmniej 3 zamówienia na produkty w butelkach.
Wyświetl nazwy kolumn w kolejności: KLIENT, LICZBA_ZAM, 
uporządkowane od największej liczby zamówień, a następnie alfabetycznie po nazwie klienta.

Select customers.CompanyName as 'klient',COUNT(orders.OrderID) as 'liczba_zam' from customers
Join orders on Customers.CustomerID=Orders.CustomerID
Join [Order Details] on Orders.OrderID=[Order Details].OrderID
Join Products on [Order Details].ProductID=Products.ProductID
Where Products.QuantityPerUnit like '%bottle%' and DATEPART(yy,Orders.OrderDate) = 1996
Group by Customers.CompanyName
having COUNT(orders.OrderID) >= 3
Order by COUNT(orders.OrderID) desc, Customers.CompanyName 