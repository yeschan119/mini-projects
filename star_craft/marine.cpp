// define star-craft marine's property & marine's activity
#include <iostream>

class Marine {
    //stattic member변수는 객체가 소멸되어도 소멸되지 않고, 이 클래스의 모든 객체가 공유
    //static member변수 역시 다른 클래스 멤버 번수들 처럼 선언과 동시에 초기화가 안됨
    //선언과 동시에 초기와가 가능한 변수는 const static int x = 0밖에 없음
    static int total_marine_num;
    int physical;     // marine physical
    int pos_x, pos_y; // marine position
    const int damage;   // attack power
    bool is_dead;
    char *name;    // marine name
    const int default_damage; //default attack power

    public:
        Marine();
        Marine(int x, int y, const char *marine_name);
        ~Marine();

        int attack() const;
        Marine& be_attacked(int damage);
        void move(int x, int y);
        void show_status();
        //static함수 역시 static변수와 같은 기능 수행
        static void show_total_marine();
};
//모든 전역 및 static 변수들은 정의와 동시에 0으로 초기화 되지만
//클래스 안의 static 변수들은 아래와 같은 방법으로 초기화 한다.
int Marine::total_marine_num = 0;
//static함수 내에서는 static변수만 사용, 일반 변수를 사용하면 어떤 객체의 변수인지 전혀 모름, static함수는 클래스 소속이기에
void Marine::show_total_marine() {
    std::cout << "total number of marine : " << total_marine_num << std::endl;
}

//이렇게 initialize list로 초기화 하면 생성과 동시에 초기화가 진행되므로 좀 더 효율적이다.
//생성과 동시에 초기화를 하면 int a = 10;과 같은 형태인데 만일 타입이 클래스일 경우 이렇게 하는 게 효과적임.
//또한 클래스 내부에 reference나 상수를 넣고 싶다면 무조건 초기화 리스트를 사용해서 초기화 시켜주어야 함
Marine::Marine()
    : physical(50), pos_x(0), pos_y(0), damage(5), default_damage(5), is_dead(false) {
        name = new char[strlen("marine") + 1];
        strcpy(name, "marine");
        total_marine_num++;
    }

Marine::Marine(int x, int y, const char* marine_name)
    : physical(50), pos_x(x), pos_y(y), damage(5), default_damage(10), is_dead(false) {
    name = new char[strlen(marine_name) + 1];
    strcpy(name, marine_name);
    total_marine_num++;
}

//상수 멤버 함수
//상수 멤버 함수는 다르 변수의 값을 바꾸지 않는다는 것을 명시
//상수함수 내에서는 객체들의 읽기만 수행. 상수함수 내에서 호출할 수 있는 함수로는 다른 상수함수밖에 없음.
int Marine::attack() const {return damage;}
Marine& Marine::be_attacked(int damage) {
    physical -= damage;
    if (physical <= 0)
        is_dead = true;
    return *this;
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
    total_marine_num--;
    if (name != NULL)
        delete[] name;
}
/*
void create_marine(Marine* marines, int i) {
    marines[i] = new Marine(5, 10, "Marine 3"); 
}
*/
int main() {
    Marine* marines[100];

    marines[0] = new Marine(2, 3, "Marine 5");
    marines[1] = new Marine(3, 5, "Marine 2");
    marines[2] = new Marine(5, 5, "Marine 3");

    marines[0]->show_status();
    marines[1]->show_status();
    marines[2]->show_status();

    //static함수는 어떤 객체에 종속된 것이 아니라 클래스에 종속된 것이므로 호출할 때 class::func 형식으로 호출
    Marine::show_total_marine();

    std::cout << std::endl << "마린 2가 마린 5 를 공격! " << std::endl;

    marines[0]->be_attacked(marines[1]->attack());

    marines[0]->show_status();
    marines[1]->show_status();

    delete marines[0];
    delete marines[1];
}