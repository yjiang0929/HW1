module demorgan
(
  input  A,          // Single bit inputs
  input  B,
  output nA,         // Output intermediate complemented inputs
  output nB,
  output nAandnB,     // Single bit output, (~A)*(~B)
  output AorB,
  output nAorB,
  output AandB,      // Second demorgan law
  output nAandB,
  output nAornB
);

  wire nA;
  wire nB;
  wire AorB;
  wire AandB;

  not Ainv(nA, A);  	// Top inverter is named Ainv, takes signal A as input and produces signal nA
  not Binv(nB, B);
  and andgate(nAandnB, nA, nB); 	// AND gate produces nAandnB from nA and nB
  or orgate(AorB, A, B);   // OR gate produce AorB
  not orinv(nAorB, AorB);    // NOT produces signal nAorB

  or orgate(nAornB, nA, nB);   // Start of second demorgan law
  and andgate(AandB, A, B);
  not andinv(nAandB, AandB);

endmodule
