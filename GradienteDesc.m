x=load('ex2x.dat'); %se cargan los valores de x
y=load('ex2y.dat'); %se cargan los valores de y

i = 0;
tetha0 = 0;
tetha1 = 0.5;
alpha = 0.01;
m = length(x);
arregloTethas = [tetha0; tetha1];
arregloUnos = ones(m,1);
error = [];
xUnos = [arregloUnos, x];


while(i < 1500)
    tempTetha = (xUnos')*((xUnos*arregloTethas)-y);
    arregloTethas = arregloTethas - ((alpha/m) *tempTetha); 
    costoJ= (1/(2*m))*((((xUnos*arregloTethas)-y)')*((xUnos*arregloTethas)-y)); %funcion de costo con multiplicacion de matrices
    error = [error,costoJ];
    i=i+1;
end

figure
hold on
subplot(2,2,1);
plot(x,y,'x');
subplot(2,2,2);
plot(x,arregloTethas(1)+arregloTethas(2)*x);
disp(arregloTethas(1));
disp(arregloTethas(2));
subplot(2,2,3);
plot(error,'g');
