// define star-craft marine's property & marine's activity
#include <iostream>

class Marine {
    int physical;     // marine physical
    int pos_x, pos_y; // marine position
    const int damage;   // attack power
    bool is_dead;
    char *name;    // marine name

    public:
        Marine();
        Marine(int x, int y, const char *marine_name);
        ~Marine();

        int attack();
        void be_attacked(int damage);
        void move(int x, int y);
        void show_status();
};

//이렇게 initialize list로 초기화 하면 생성과 동시에 초기화가 진행되므로 좀 더 효율적이다.
Marine::Marine()
    : physical(50), pos_x(0), pos_y(0), damage(5), is_dead(false) {
        name = new char[strlen("marine") + 1];
        strcpy(name, "marine");
    }

Marine::Marine(int x, int y, const char* marine_name)
    : physical(50), pos_x(x), pos_y(y), damage(5), is_dead(false) {
    name = new char[strlen(marine_name) + 1];
    strcpy(name, marine_name);
}

int Marine::attack() {return damage;}
void Marine::be_attacked(int damage) {
    physical -= damage;
    if (physical <= 0)
        is_dead = true;
}

void Marine::move(int x, int y) {
    pos_x = x;
    pos_y = y;
}

void Marine::show_status() {
    std::cout << "*** Marine ***" << std::endl;
    std::cout << "Location : ( " << pos_x << " , " << pos_y << " ) " << std::endl;
    std::cout << "Physical : " << physical << std::endl;
}

Marine::~Marine() {
    std::cout << name << " 의 소멸자 호출!" << std::endl;
    if (name != NULL)
        delete[] name;
}

int main() {
    Marine* marines[100];

    marines[0] = new Marine(2, 3, "Marine 5");
    marines[1] = new Marine(3, 5, "Marine 2");

    marines[0]->show_status();
    marines[1]->show_status();

    std::cout << std::endl << "마린 2가 마린 5 를 공격! " << std::endl;

    marines[0]->be_attacked(marines[1]->attack());

    marines[0]->show_status();
    marines[1]->show_status();

    delete marines[0];
    delete marines[1];
}