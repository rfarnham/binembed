    .global _data_start
    .global _data_end
    .global _data_size
    .data
_data_start:
    .incbin "out/data.bin"
_data_end:  
_data_size:
    .int _data_end - _data_start
