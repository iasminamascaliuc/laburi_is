method Triple (x: int ) returns (r: int)
{
    var y := 2 * x;
    r := x + y;
    
}
//daca x=10, rezultatul e 30 

method Caller() {
var t := Triple (18) ;//54 
// assert t < 100; eroare
}

method Triple2 (x: int ) returns (r: int)
{
    var y := 2 * x;
    r := x + y;
    assert r == 3 * x ;//  assert r == 3 * x +1 ne da eroare 
}

method Triple3 (x: int ) returns (r: int)
 {
 var y := 2 * x;
 r := x + y;
 assert r==3*x;//assert r == 10 * x;
 // pentru assert r < 5, x nu este definit 
 //assert false nu are sens
 }

 method Triple4(x: int ) returns (r: int)
 {
 if x == 0{
 r := 0;//functioneaza
 } else {
 var y := 2 * x;
 r := x + y;
 }
 assert r == 3 * x;
 }


 method Caller4() {
var t := Triple4(18) ;//54 
var v := Triple4(0);//0
}

method Triple5 (x: int ) returns (r: int)
 {
 if {
        case x < 18 =>
            var a, b := 2 * x, 4 * x;
            r := (a+b) / 2;
        case 0 <= x =>
            var y := 2 * x;
            r := x + y;
   }
    assert r == 3 * x;
 }

 method Caller5() {
var t := Triple5(18) ;//54 
var v := Triple5(3);//9
}


method Triple6 (x: int ) returns (r: int)
 ensures r == 3 * x// respectat 
 {
 var y := 2 * x;
 r := x + y;

 }
method Triple7 (x: int ) returns (r: int)
 requires x % 2 == 0// eroare r ar putea sa nu fie exact 3 * x.

ensures r == 3 * x
 {

 var y := x / 2;
 r := 6 * y;
 }
 //preconditia = conditia care trebuie sa fie adevarata inainte de executarea metodei
 // in exemplu, requires x % 2 == 0 ne asigura ca metoda Triple se apeleaza numai cu numere pare, 
 //deci impartirea x / 2 ne da un rezultat intreg

 //postconditia = conditia care trebuie sa fie adevarata dupa executarea metodei 
 //postconditia ensures r == 3 * x ne asigura ca rezultatul r e mereu de trei ori valoarea lui x.


method Min(x: int , y: int ) returns (m: int )
 ensures m <= x && m <= y
 {
 if x <= y {
 m := x;
 } else {
 m := y;
 }
 }

method Minfake (x: int , y: int) returns (m: int )
 ensures m <= x && m <= y
{
 if x <= y {
 m := x - 10;
 } else {
m := y - 20;
}
}