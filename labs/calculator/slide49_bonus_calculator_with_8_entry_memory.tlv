\m4_TLV_version 1d: tl-x.org
\SV
   // This code can be found in: https://github.com/stevehoover/RISC-V_MYTH_Workshop
   
   m4_include_lib(['https://raw.githubusercontent.com/stevehoover/RISC-V_MYTH_Workshop/ecba3769fff373ef6b8f66b3347e8940c859792d/tlv_lib/calculator_shell_lib.tlv'])

\SV
   m4_makerchip_module   // (Expanded in Nav-TLV pane.)

\TLV
   |calc
      @0
         $reset = *reset;
      @1
         $valid = $reset ? 1'b0 : (>>1$valid + 1'b1);
         $valid_or_reset = $valid || $reset;

         // Memory interface: mem writes $val2 and recall reads, both at index $val1[2:0].
         $wr_en = $valid && ($op[2:0] == 3'd5);
         $rd_en = $valid && ($op[2:0] == 3'd4);
         $wr_index[2:0] = $val1[2:0];
         $rd_index[2:0] = $val1[2:0];
         $wr_data[31:0] = $val2;

         // Write
         /entry[7:0]
            $wr = |calc$wr_en && (#entry == |calc$wr_index);
            $value[31:0] = |calc$reset ? 32'b0 :
                           $wr         ? |calc$wr_data :
                                         $RETAIN;
      @2
         // Read
         ?$rd_en
            $rd_data[31:0] = /entry[$rd_index]$value;
      ?$valid_or_reset
         @1
            $val1[31:0] = >>2$out;
            $val2[31:0] = $rand2[3:0];

            $sum[31:0] = $val1 + $val2;
            $diff[31:0] = $val1 - $val2;
            $prod[31:0] = $val1 * $val2;
            $quot[31:0] = $val1 / $val2;
         @2
            $out[31:0] = $reset ? 32'b0 :
                         ($op[2:0] == 3'd0) ? $sum :
                         ($op[2:0] == 3'd1) ? $diff :
                         ($op[2:0] == 3'd2) ? $prod :
                         ($op[2:0] == 3'd3) ? $quot :
                         ($op[2:0] == 3'd4) ? $rd_data :
                                              32'b0;

      // Macro instantiations for calculator visualization(disabled by default).
      // Uncomment to enable visualisation, and also,
      // NOTE: If visualization is enabled, $op must be defined to the proper width using the expression below.
      //       (Any signals other than $rand1, $rand2 that are not explicitly assigned will result in strange errors.)
      //       You can, however, safely use these specific random signals as described in the videos:
      //  o $rand1[3:0]
      //  o $rand2[3:0]
      //  o $op[x:0]
      
   //m4+cal_viz(@3) // Arg: Pipeline stage represented by viz, should be atleast equal to last stage of CALCULATOR logic.

   
   // Assert these to end simulation (before Makerchip cycle limit).
   *passed = *cyc_cnt > 40;
   *failed = 1'b0;
   

\SV
   endmodule
