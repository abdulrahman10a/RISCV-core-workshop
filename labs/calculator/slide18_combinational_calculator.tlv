\m4_TLV_version 1d: tl-x.org
\SV
   m4_makerchip_module   // (Expanded in Nav-TLV pane.)
\TLV
   $reset = *reset;

   $val1[31:0] = $rand1[3:0];
   $val2[31:0] = $rand2[3:0];

   $sum[31:0] = $val1 + $val2;
   $diff[31:0] = $val1 - $val2;
   $prod[31:0] = $val1 * $val2;
   $quot[31:0] = $val1 / $val2;

   $out[31:0] = ($op[1:0] == 2'd0) ? $sum :
                ($op[1:0] == 2'd1) ? $diff :
                ($op[1:0] == 2'd2) ? $prod :
                                     $quot;

   $cnt[31:0] = $reset ? 32'b0 : (>>1$cnt + 1);

   // Assert these to end simulation (before Makerchip cycle limit).
   *passed = *cyc_cnt > 40;
   *failed = 1'b0;
\SV
   endmodule
