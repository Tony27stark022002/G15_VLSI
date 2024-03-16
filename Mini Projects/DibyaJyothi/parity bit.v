module even_parity(input a,b,c,d,output y);
wire w1,w2;
xor g1(w1,a,b);
xor g2(w2,c,d);
xor g3(y,w1,w2);
endmodule
