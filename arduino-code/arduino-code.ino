#include <Adafruit_NeoPixel.h>

char chr;
uint32_t color = 0;

Adafruit_NeoPixel strip(1, 6, NEO_GRB + NEO_KHZ800);

void setup() {
  pinMode(13, OUTPUT);
  Serial.begin(9600);
  strip.begin();
  strip.show();
  strip.setBrightness(50);
  

}

void loop() {
  

    if (Serial.available())
    {
        chr = Serial.read();

        switch (chr) {
          case '0':
            color = 255;
            break;
          case '1':
            color = 255 << 8;
            break;
          case '2':
            color = 255 << 16;
            break;
          case '3':
            color = (255 << 8) | 255;
            break;
          case '4':
            color = (255 << 8) | (255 << 16);
            break;
          case '5':
            color = (255 << 16) | 255;
            break;
          case '6':
            color = -1;
            break;
          default:
            break;
        }
        strip.setPixelColor(0, color);
        strip.show();
    }

}
