# Индикатор TeamHP

Уже довольно давно лежит у меня в закромах простенький модик, отображающий суммарное количество здоровья команд. Выглядит он примерно так:

![Team health screenshot](https://frm-wows-ru.wgcdn.co/wows_forum_ru/monthly_2018_03/image.thumb.png.d1a3f7a75b2b4665eff4970a41040633.png)
 

Понятное дело, игра накладывает некоторые ограничения на реализацию, в частности:
- у кораблей вне видимости (или вне засвета) не обновляется значение здоровья;
- в начале боя не известны топ-сток корпуса; информация выводимая индикаторами обновляется по мере поступления информации.

В остальном все работает именно так, как должно.

Установка простая: распаковать архив из releases в res_mods, запустить игру.
