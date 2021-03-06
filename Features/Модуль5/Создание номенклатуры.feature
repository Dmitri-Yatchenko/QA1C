#language: ru

@tree
Функционал: номенклатура
Как тестировщик я хочу
создать номенклатуру
чтобы протестировать работу цикла

Контекст:
	//Дано Я открыл новый сеанс TestClient или подключил уже существующий
	Дано Я запускаю сценарий открытия TestClient или подключаю уже существующий

Сценарий: создание номенклатуры
И В командном интерфейсе я выбираю 'Склад' 'Номенклатура'
Тогда открылось окно 'Номенклатура'
И Я запоминаю значение выражения '0' в переменную "Шаг"
И я делаю 10 раз 
	И Я запоминаю значение выражения '$Шаг$ + 1' в переменную 'Шаг'
	И Я запоминаю значение выражения '"Номенклатура" + $Шаг$' в переменную 'Наименование'
	И в таблице "List" я активизирую поле с именем "ItemType"
	И я нажимаю на кнопку с именем 'FormCreate'
	Тогда открылось окно 'Номенклатура (создание)'
	И в поле с именем 'Description_en' я ввожу текст  '$Наименование$'
	И я нажимаю кнопку выбора у поля с именем "ItemType"
	Тогда открылось окно 'Виды номенклатуры'
	И в таблице "List" я активизирую поле с именем "Description"
	И в таблице "List" я выбираю текущую строку
	Тогда открылось окно 'Номенклатура (создание) *'
	И я нажимаю кнопку выбора у поля с именем "Unit"
	Тогда открылось окно 'Единицы измерения'
	И в таблице "List" я выбираю текущую строку
	Тогда открылось окно 'Номенклатура (создание) *'
	И я нажимаю на кнопку с именем 'FormWriteAndClose'
	И я жду закрытия окна 'Номенклатура (создание) *' в течение 20 секунд