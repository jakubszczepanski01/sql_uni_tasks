Zad 1. Ile zamówień zrealizowali poszczególni przewoźnicy i ile łącznie za nie dostali w roku 1997.
Wyświetl trzy kolumny: identyfikator przewoźnika (ShipVia), liczba zamówień, łączny koszt przewozu (Freight)

Select Count(OrderID) as 'Liczba zamówień', sum(Freight) as 'Łączny koszt przewozu', ShipVia as 'Identyfikator przewoźnika'  from Orders
Where YEAR(shippeddate) = 1997 and ShippedDate is not null
Group by ShipVia



Zad 2. Jaki jest średni czas (w dniach) realizacji zamówienia (od złożenia do wysłania) przez poszczególnych pracowników.
Wyświetl dwie kolumny: identyfikator pracownika, średni czas dostawy.
Średnia powinna być przedstawiona jako ułamek (liczba z przecinkiem).

Select  avg(cast(ShippedDate-OrderDate as float)) as 'średni czas dostawy (w dniach)', EmployeeID as 'identyfikator pracownika' from orders
Where ShippedDate is not null
Group by EmployeeID
Order by EmployeeID asc

Zad 3. Pokaż pracowników, którzy w pierwszej połowie 1997 roku przyjęli więcej niż 15 zamówień
Wyświetl dwie kolumny: identyfikator pracownika, liczba zamówień

Select COUNT(OrderID) as 'liczba zamówień' , EmployeeID as 'identyfikator pracownika'  from Orders
Where YEAR(ShippedDate) = 1997 and MONTH(ShippedDate) <= 6
Group by EmployeeID
Having Count(OrderID) > 15