class Puck {


float x = width/2;
float y = height/2;
float xspeed;
float yspeed;
float r = 12;


Puck(){
        reset();
}

void checkPaddleLeft(Paddle p){
        if (y < p.y + p.h/2 && y > p.y -p.h/2 &&  x - r < p.x + p.w/2) {
                if (x > p.x) {
                        float diff = y - (p.y - p.h/2);
                        float rad = radians(45);
                        float angle = map (diff, 0, p.h, -rad,rad);
                        xspeed = 5 * cos(angle);
                        yspeed = 5 * sin(angle);
                        x = p.x + p.w/2 + r;
                        //xspeed *= -1;
                }
        }
}

void checkPaddleRight(Paddle p){
        if (y < p.y + p.h/2 && y > p.y -p.h/2 &&  x + r > p.x - p.w/2) {
                if ( x < p.x) {
                        float diff = y - (p.y - p.h/2);
                        float rad = radians(135);
                        float angle = map (diff, 0, p.h, -rad, rad);
                        xspeed = 5 * cos(angle);
                        yspeed = 5 * sin(angle);
                        x = p.x - p.w/2 - r;
                        //xspeed *= -1;
                }
        }
}

void update(){
        x = x+xspeed*1;
        y = y+yspeed*1;
}


void reset(){
        x = width/2;
        y = height/2;

        float angle = random(-PI/4, PI/4);

        xspeed = 5 * cos(angle);
        yspeed = 5 * sin(angle);

        if ( random(1) < 0.5 ) {
                xspeed *= -1;
        }

}

void edges(){
        if(y < 0 || y > height) {
                yspeed *= -1;
        }

        if(x > width - right.w) {
                burp.play();
                leftScore++;
                reset();
        }

        if(x < left.w) {
                bone.play();
                rightScore++;
                reset();
        }
}

void show(){
        fill(255);
        ellipse(x, y, r*2, r*2);
}



}
