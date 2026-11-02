\m4_TLV_version 1d: tl-x.org
\SV
   m4_makerchip_module   // (Expanded in Nav-TLV pane.)
\TLV
   $reset = *reset;

   $cnt[31:0] = $reset ? 32'b0 : (>>1$cnt + 1);

   // Assert these to end simulation (before Makerchip cycle limit).
   *passed = *cyc_cnt > 40;
   *failed = 1'b0;
\SV
   endmodule
