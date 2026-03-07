/**
 * @brief base64 test program
 *
 * Cross Platform Edition, based on atari version by Thomas Cherryhomes
 * 
 * @author Mark Fisher
 * @license gpl v. 3, see LICENSE for details.
 */

#include <string.h>
#include <stdlib.h>
#include <conio.h>
#include "fujinet-fuji.h"

char test_in[20];
char test_out[20];

const char *test_text = "Hello World";
char encoded_text[40];
unsigned long encoded_len;

const char *test_base64 = "SGVsbG8gV29ybGQ=";
char decoded_text[40];
unsigned long decoded_len;

char *version = "v1.0.1";

int main(void)
{
  char *header = "BASE64 TEST PROGRAM";
  uint8_t x, y;
  screensize(&x, &y);
  clrscr();
  fc_cputsxy((x - strlen(header))/2, 0, header);
  fc_cputsxy((x - strlen(version))/2, 1, version);

  fc_cputsxy(8, 3, "INP COM LEN OUTPUT");

  fc_cputsxy(1, 5, "ENCODE");

  if (!fuji_base64_encode_input((char *)test_text, strlen(test_text))) {
    fc_cputsxy(0, 10, "BASE64 ENCODE INPUT FAILED\n");
    return 1;
  }
  fc_gotox(9);
  cputc('X');

  if (!fuji_base64_encode_compute()) {
    fc_cputsxy(0, 10, "BASE64 ENCODE COMPUTE FAILED\n");
    return 1;
  }
  fc_gotox(13);
  cputc('X');

  if (!fuji_base64_encode_length(&encoded_len)) {
    fc_cputsxy(0, 10, "BASE64 ENCODE LENGTH FAILED\n");
    return 1;
  }
  fc_gotox(17);
  cprintf("%ld", encoded_len);
  
  if (!fuji_base64_encode_output(encoded_text, encoded_len)) {
    fc_cputsxy(0, 10, "BASE64 ENCODE OUTPUT FAILED\n");
    return 1;
  }
  fc_gotox(20);
  cputs(encoded_text);


  fc_cputsxy(1, 6, "DECODE");

  if (!fuji_base64_decode_input((char *)test_base64,strlen(test_base64))) {
    fc_cputsxy(0, 10, "BASE64 DECODE INPUT FAILED\n");
    return 1;
  }
  fc_gotox(9);
  cputc('X');

  if (!fuji_base64_decode_compute()) {
    fc_cputsxy(0, 10, "BASE64 DECODE COMPUTE FAILED\n");
    return 1;
  }
  fc_gotox(13);
  cputc('X');

  if (!fuji_base64_decode_length(&decoded_len)) {
    fc_cputsxy(0, 10, "BASE64 DECODE LENGTH FAILED\n");
    return 1;
  }
  fc_gotox(17);
  cprintf("%ld", decoded_len);

  if (!fuji_base64_decode_output(decoded_text, decoded_len)) {
    fc_cputsxy(0, 10, "BASE64 ENCODE OUTPUT FAILED\n");
    return 1;
  }
  fc_gotox(20);
  cputs(decoded_text);

  fc_gotoxy(2, 11);

  cgetc();
  return 0;
}
