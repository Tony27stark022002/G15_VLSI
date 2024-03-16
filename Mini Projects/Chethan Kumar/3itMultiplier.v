module mul(a,b,p);
  input [2:0]a,b;
  output [5:0]p;
  
  and a1(p[0],a[0],b[0]);
  and a2(w1,a[1],b[0]);
  and a3(w2,a[2],b[0]);
  and a6(w3,a[0],b[1]);
  and a4(w4,a[1],b[1]);
  and a5(w5,a[2],b[1]);
  and a7(w6,a[0],b[2]);
  and a8(w7,a[1],b[2]);
  and a9(w8,a[2],b[2]);
  
  HA ha1(w1,w3,p[1],w9);
  FA fa1(w2,w4,w9,w12,w10);
  FA fa2(w5,0,w10,w13,w11);
  
  HA ha2(w12,w6,p[2],w14);
  FA fa3(w13,w7,,w14,p[3],w15);
  FA fa4(w8,w11,w1,p[4],p[5]);
  
  
endmodule

//full adder 

module FA(a,b,cin,sum,cout);
  input a,b,cin;
  output sum,cout;
    assign sum_out = a^b^c;
  assign cout = (a&b)|(b&cin)|(cin&a);
endmodule

//half adder

module HA(a,b,sum,carry);
  input a,b;
  output sum,carry;
  
  assign sum=a^b;
  assign carry=a&b;
endmodule
