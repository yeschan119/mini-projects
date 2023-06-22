// 포토캐논
#include <string.h>
#include <iostream>

class Photon_Cannon {
    int hp, shield;
    int coord_x, coord_y;
    int damage;
    char *name;

    public:
        Photon_Cannon();
        Photon_Cannon(int x, int y, char * connon_name);
        Photon_Cannon(const Photon_Cannon& pc);
        ~Photon_Cannon();
        void show_status();
};

Photon_Cannon::Photon_Cannon()
{
    hp = 0;
    shield = 0;
    coord_x = 0;
    coord_y = 0;
    damage = 0;
    name = NULL;
}

// 기본 복사 생성자를 사용하면 name에 대해 shallow copy를 하므로
// 같은 name을 여러번 copy하면 나중에 delete 하면서 런타임 오류가 생김
Photon_Cannon::Photon_Cannon(const Photon_Cannon& pc) {
    std::cout << "복사 생성자 호출 !" << std::endl;
    hp = pc.hp;
    shield = pc.shield;
    coord_x = pc.coord_x;
    coord_y = pc.coord_y;
    damage = pc.damage;

    name = new char[strlen(pc.name) + 1];
    strcpy(name, pc.name);
}

Photon_Cannon::Photon_Cannon(int x, int y, char *connon_name) {
    std::cout << "생성자 호출 !" << std::endl;
    hp = shield = 100;
    coord_x = x;
    coord_y = y;
    damage = 20;

    name = new char[strlen(connon_name) + 1];
    strcpy(name, connon_name); 
}

Photon_Cannon::~Photon_Cannon() {
    std::cout << "phton_cannon 제거" << std::endl;

    if (name) delete[] name;
}

void Photon_Cannon::show_status() {
    std::cout << "Photon Cannon :: " << name << std::endl;
    std::cout << "Photon Cannon " << std::endl;
    std::cout << " Location : ( " << coord_x << " , " << coord_y << " ) "
                << std::endl;
    std::cout << " HP : " << hp << std::endl;
}

int main() {
    Photon_Cannon pc1(3, 3, "conncon");
    Photon_Cannon pc2(pc1);
    Photon_Cannon pc3 = pc2;  // 복사 대입 연사을 할 때는 그냥 복사 생성자가 호출됨.
    Photon_Cannon pc4;
    pc4 = pc1;                 //이때는 대입 연산자가 호출됨.
    pc1.show_status();
    pc2.show_status();
}