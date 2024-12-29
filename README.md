# 8x8_Bit_Memory_IC
8Byte Memory Integrated Circuit, created for a course at the Norwegian University of Science and Technology. As this was made as part of a course at university, there were some restrictions on how the code had to be written and designed.

The IC is structured around Bitcells, each containing 1 bit of data. 8 bitcells combine to make 1 byte, and 8 of these bytes make up the 8 bytes of memory. Because of this the memory can only write 8bit words to eight different adresses. The memory unit is controlled by a finite state machine to ensure proper operation. The FSM has four states: read, write, idle and stable. 

The Bitcell was first designed and tested using the spice program AIM Spice. The bitcell was built on the 90nm gpdk transistor, and tested in various process corners, and temperatures.
