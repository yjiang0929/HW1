`include "hw1.v"

module demorgan_test ();

  // Instantiate device/module under test
  reg A, B;                // Primary test inputs
  wire nA, nB, nAandnB, AorB, nAorB, AandB, nAandB, nAornB;    // Test outputs

  demorgan dut(A, B, nA, nB, nAandnB, AorB, nAorB, AandB, nAandB, nAornB);  // Module to be tested


  // Run sequence of test stimuli
  initial begin
    $display("Truth Table for ~A~B=~(A+B)");
    $display("A B | ~A ~B | ~A~B | A+B | ~(A+B)");            // Prints header for truth table
    A=0;B=0; #1                                 // Set A and B, wait for update (#1)
    $display("%b %b |  %b  %b |   %b  |  %b  |  %b", A,B, nA, nB, nAandnB, AorB, nAorB);
    A=0;B=1; #1                                 // Set A and B, wait for new update
    $display("%b %b |  %b  %b |   %b  |  %b  |  %b", A,B, nA, nB, nAandnB, AorB, nAorB);
    A=1;B=0; #1
    $display("%b %b |  %b  %b |   %b  |  %b  |  %b", A,B, nA, nB, nAandnB, AorB, nAorB);
    A=1;B=1; #1
    $display("%b %b |  %b  %b |   %b  |  %b  |  %b", A,B, nA, nB, nAandnB, AorB, nAorB);

    $display(" ");
    $display("Truth Table for ~A+~B=~(AB)");
    $display("A B | ~A ~B | ~A+~B | AB | ~(AB)");            // Prints header for truth table
    A=0;B=0; #1                                 // Set A and B, wait for update (#1)
    $display("%b %b |  %b  %b |   %b   |  %b |   %b", A,B, nA, nB, nAornB, AandB, nAandB);
    A=0;B=1; #1                                 // Set A and B, wait for new update
    $display("%b %b |  %b  %b |   %b   |  %b |   %b", A,B, nA, nB, nAornB, AandB, nAandB);
    A=1;B=0; #1
    $display("%b %b |  %b  %b |   %b   |  %b |   %b", A,B, nA, nB, nAornB, AandB, nAandB);
    A=1;B=1; #1
    $display("%b %b |  %b  %b |   %b   |  %b |   %b", A,B, nA, nB, nAornB, AandB, nAandB);
  end
endmodule    // End demorgan_test
