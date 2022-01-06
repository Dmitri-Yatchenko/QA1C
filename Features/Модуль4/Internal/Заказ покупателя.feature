﻿#language: ru

@tree
Функционал: заказ покупателя
Как Менеджер по продажам я хочу
протестировать заполнение полей
чтобы протестировать заполнение следующих полей документа Заказ покупателя: Партнер, Соглашение, блокировку поля Контрагент в случае если не выбран Партнер

Контекст:
	//Дано Я открыл новый сеанс TestClient или подключил уже существующий
	Дано Я запускаю сценарий открытия TestClient или подключаю уже существующий

Сценарий: проверка заполнения партнера, соглашения и блокировку Контрагента
	*Заполнение документа заказ покупателя
		Дано я закрываю все окна клиентского приложения	
		И В командном интерфейсе я выбираю 'Продажи' 'Заказы покупателей'
		Тогда открылось окно 'Заказы покупателей'
		И я нажимаю на кнопку с именем 'FormCreate'
		Тогда открылось окно 'Заказ покупателя (создание)'
		И я нажимаю кнопку выбора у поля с именем "Partner"
		Тогда открылось окно 'Партнеры'
		И в таблице "List" я активизирую поле с именем "Description"
		И в таблице "List" я выбираю текущую строку
		Тогда открылось окно 'Заказ покупателя (создание) *'
		И в таблице "ItemList" я активизирую поле с именем "ItemListLineNumber"
		И в таблице "ItemList" я нажимаю на кнопку с именем 'ItemListAdd'
		И в таблице "ItemList" я активизирую поле с именем "ItemListItem"
		И в таблице "ItemList" я нажимаю кнопку выбора у реквизита с именем "ItemListItem"
		Тогда открылось окно 'Номенклатура'
		И в таблице "List" я перехожу к строке:
			| 'Код' | 'Наименование'            | 'Ссылка'                  |
			| '2'   | 'Товар без характеристик' | 'Товар без характеристик' |
		И в таблице "List" я активизирую поле с именем "Description"
		И в таблице "List" я выбираю текущую строку
		Тогда открылось окно 'Заказ покупателя (создание) *'
		И в таблице "ItemList" я завершаю редактирование строки
	* Проверка заполнения цены из соглашения		
		Тогда таблица "ItemList" стала равной:
			| 'Номенклатура'            | 'Характеристика'          | 'Ед. изм.' | 'Вид цены' | 'Цена'   |
			| 'Товар без характеристик' | 'Товар без характеристик' | 'шт'       | 'Опт'      | '450,00' |
	* Проверка Блокировки поля  Контрагент в случае если не выбран Партнер
		И в поле с именем 'Partner' я ввожу текст ''
		И элемент формы "Контрагент" не доступен			