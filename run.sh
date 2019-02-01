#assemble boot file
as boot.S -o boot.o

#compile kernel.c file
gcc -c kernel.c -o kernel.o -std=gnu99 -ffreestanding -O2 -Wall -Wextra

#linking the kernel with kernel.o and boot.o files
gcc -T linker.ld -o myos.bin -ffreestanding -O2 -nostdlib kernel.o boot.o -lgcc

#check myos.bin file is x86 multiboot file or not
grub-file --is-x86-multiboot myos.bin

#building the iso file
#because grub requires it to load the menutry and when option is slected, then load the myos.bin file
mkdir -p isodir/boot/grub
cp myos.bin isodir/boot/myos.bin
cp grub.cfg isodir/boot/grub/grub.cfg
grub-mkrescue -o myos.iso isodir

#run in qemu
qemu-system-x86_64 -cdrom myos.iso
