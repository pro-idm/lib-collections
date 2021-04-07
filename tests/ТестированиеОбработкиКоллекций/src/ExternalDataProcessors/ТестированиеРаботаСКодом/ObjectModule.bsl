#Область ИнициализацияЯдра

Перем КонтекстЯдра;
Перем Утверждения;

Перем СоответствиеТипов; 

//{ основная процедура для юнит-тестирования xUnitFor1C
Процедура Инициализация(КонтекстЯдраПараметр) Экспорт
	КонтекстЯдра = КонтекстЯдраПараметр;
	Утверждения = КонтекстЯдра.Плагин("БазовыеУтверждения");

	СоответствиеТипов = ПолучитьСоответствиеТиповТокенов();
КонецПроцедуры

Процедура ПередЗапускомТеста() Экспорт
КонецПроцедуры

Процедура ПослеЗапускаТеста() Экспорт
КонецПроцедуры

#КонецОбласти

Функция ПолучитьСоответствиеТиповТокенов()
	СоответствиеТипов = Новый Соответствие;

	СоответствиеТипов.Вставить("Неизвестный", 0);
	СоответствиеТипов.Вставить("ЛеваяСкобка", 1);
	СоответствиеТипов.Вставить("ПраваяСкобка", 2);
	СоответствиеТипов.Вставить("Точка", 3);
	СоответствиеТипов.Вставить("Равно", 4);
	СоответствиеТипов.Вставить("ТочкаСЗапятой", 5);
	СоответствиеТипов.Вставить("Идентификатор", 6);
	СоответствиеТипов.Вставить("Пробелы", 7);
	СоответствиеТипов.Вставить("Строка", 8);
	СоответствиеТипов.Вставить("КлючевоеСлово", 9);
	СоответствиеТипов.Вставить("Функция", 10);
	СоответствиеТипов.Вставить("Параметр", 11);
	СоответствиеТипов.Вставить("Переменная", 12);
	СоответствиеТипов.Вставить("Поле", 13);

	Возврат СоответствиеТипов;
КонецФункции

Процедура ЗаполнитьНаборТестов(НаборТестов, КонтекстЯдраПараметр) Экспорт
	КонтекстЯдра = КонтекстЯдраПараметр;

	НаборТестов.НачатьГруппу("Лексический анализ");
	НаборТестов.Добавить("Тест_ЛА_ЛеваяСкобка");
	НаборТестов.Добавить("Тест_ЛА_ПраваяСкобка");
	НаборТестов.Добавить("Тест_ЛА_Точка");
	НаборТестов.Добавить("Тест_ЛА_Равно");
	НаборТестов.Добавить("Тест_ЛА_ТочкаСЗапятой");
	НаборТестов.Добавить("Тест_ЛА_Идентификатор");
	НаборТестов.Добавить("Тест_ЛА_ИдентификаторСПодчеркиванием");
	НаборТестов.Добавить("Тест_ЛА_НеизвестныйТокен");
	НаборТестов.Добавить("Тест_ЛА_ПустойКод");
	НаборТестов.Добавить("Тест_ЛА_Пробелы");
	НаборТестов.Добавить("Тест_ЛА_Строка");

	НаборТестов.НачатьГруппу("Лексический анализ: много токенов");
	НаборТестов.Добавить("Тест_ЛА_ИдентификаторыИНеизвестныеТокены");
	НаборТестов.Добавить("Тест_ЛА_ВызовФункции");

	НаборТестов.НачатьГруппу("Синтаксический анализ:");
	НаборТестов.Добавить("Тест_СА_ОдинПараметр");
	НаборТестов.Добавить("Тест_СА_ФункцияСИменемПараметра");
	НаборТестов.Добавить("Тест_СА_ФункцияСПробеламиПередСкобками");
	НаборТестов.Добавить("Тест_СА_КлючевыеСлова");
	НаборТестов.Добавить("Тест_СА_ПараметрСПолем");
	НаборТестов.Добавить("Тест_СА_ЛокальнаяПеременная");
	НаборТестов.Добавить("Тест_СА_ЛокальнаяПеременнаяСПроверкойНаРавенство");
	НаборТестов.Добавить("Тест_СА_ДвеЛокальныеПеременные");
	НаборТестов.Добавить("Тест_СА_ПеременнаяВЕсли");
	НаборТестов.Добавить("Тест_СА_ПеременныеВЕслиИначе");
	НаборТестов.Добавить("Тест_СА_ПеременнаяВЦикле");
	НаборТестов.Добавить("Тест_СА_ПеременнаяВДля");

	НаборТестов.НачатьГруппу("Добавить получение результата:");
	НаборТестов.Добавить("Тест_ДобавитьПолучениеРезультата_ОдноВыражение");
	НаборТестов.Добавить("Тест_ДобавитьПолучениеРезультата_ДваВыражения");
	НаборТестов.Добавить("Тест_ДобавитьПолучениеРезультата_ТочкаЗапятаяВКонце");
	НаборТестов.Добавить("Тест_ДобавитьПолучениеРезультата_ОднаПеременная");

	НаборТестов.НачатьГруппу("Получить код для встраивания:");
	НаборТестов.Добавить("Тесты_ПолучитьКодДляВстраивания_ОдноВыражение");
	НаборТестов.Добавить("Тесты_ПолучитьКодДляВстраивания_ОдноВыражениеБезТочкиСЗапятой");
	НаборТестов.Добавить("Тесты_ПолучитьКодДляВстраивания_ВыражениеОдинПараметр");
	НаборТестов.Добавить("Тесты_ПолучитьКодДляВстраивания_ВыражениеСПараметрами");
	НаборТестов.Добавить("Тесты_ПолучитьКодДляВстраивания_ВыражениеСПеременными");
	НаборТестов.Добавить("Тесты_ПолучитьКодДляВстраивания_СКонтекстом");
	НаборТестов.Добавить("Тесты_ПолучитьКодДляВстраивания_ПеременнаяВЕсли");
	НаборТестов.Добавить("Тесты_ПолучитьКодДляВстраивания_ПеременнаяВоВложенномЕсли");
КонецПроцедуры

#Область Тесты_ЛексическийАнализ

Процедура Тест_ЛА_ПустойКод() Экспорт
	Токены = СоздатьАнализатор().ЛексическийАнализ("");

	Утверждения.ПроверитьРавенство(Токены.Количество(), 0, "Пустой код");
КонецПроцедуры

Процедура Тест_ЛА_ЛеваяСкобка() Экспорт
	Токены = СоздатьАнализатор().ЛексическийАнализ("(");

	ТокеныШаблон = ЗначенияВМассив(Токен("ЛеваяСкобка", "("));
	ПроверитьРавенствоМассивовТокенов(ТокеныШаблон, Токены);
КонецПроцедуры

Процедура Тест_ЛА_ПраваяСкобка() Экспорт
	Токены = СоздатьАнализатор().ЛексическийАнализ(")");

	ТокеныШаблон = ЗначенияВМассив(Токен("ПраваяСкобка", ")"));
	ПроверитьРавенствоМассивовТокенов(ТокеныШаблон, Токены);
КонецПроцедуры

Процедура Тест_ЛА_Точка() Экспорт
	Токены = СоздатьАнализатор().ЛексическийАнализ(".");

	ТокеныШаблон = ЗначенияВМассив(Токен("Точка", "."));
	ПроверитьРавенствоМассивовТокенов(ТокеныШаблон, Токены);
КонецПроцедуры

Процедура Тест_ЛА_Равно() Экспорт
	Токены = СоздатьАнализатор().ЛексическийАнализ("=");

	ТокеныШаблон = ЗначенияВМассив(Токен("Равно", "="));
	ПроверитьРавенствоМассивовТокенов(ТокеныШаблон, Токены);
КонецПроцедуры

Процедура Тест_ЛА_ТочкаСЗапятой() Экспорт
	Токены = СоздатьАнализатор().ЛексическийАнализ(";");

	ТокеныШаблон = ЗначенияВМассив(Токен("ТочкаСЗапятой", ";"));
	ПроверитьРавенствоМассивовТокенов(ТокеныШаблон, Токены);
КонецПроцедуры

Процедура Тест_ЛА_Пробелы() Экспорт
	Код = " " + Символы.Таб + Символы.ПС + " ";
	Токены = СоздатьАнализатор().ЛексическийАнализ(Код);

	ТокеныШаблон = ЗначенияВМассив(Токен("Пробелы", Код));
	ПроверитьРавенствоМассивовТокенов(ТокеныШаблон, Токены);
КонецПроцедуры

Процедура Тест_ЛА_Идентификатор() Экспорт
	Токены = СоздатьАнализатор().ЛексическийАнализ("Тест");

	ТокеныШаблон = ЗначенияВМассив(Токен("Идентификатор", "Тест"));
	ПроверитьРавенствоМассивовТокенов(ТокеныШаблон, Токены);
КонецПроцедуры

Процедура Тест_ЛА_ИдентификаторСПодчеркиванием() Экспорт
	Токены = СоздатьАнализатор().ЛексическийАнализ("___1Т2009русeng_1");

	ТокеныШаблон = ЗначенияВМассив(Токен("Идентификатор", "___1Т2009русeng_1"));
	ПроверитьРавенствоМассивовТокенов(ТокеныШаблон, Токены);
КонецПроцедуры

Процедура Тест_ЛА_Строка() Экспорт
	Код = """ Тест строки
		  | многострочной
		  |";
	Токены = СоздатьАнализатор().ЛексическийАнализ(Код);

	ТокеныШаблон = ЗначенияВМассив(Токен("Строка", Код));
	ПроверитьРавенствоМассивовТокенов(ТокеныШаблон, Токены);
КонецПроцедуры

Процедура Тест_ЛА_НеизвестныйТокен() Экспорт
	Токены = СоздатьАнализатор().ЛексическийАнализ("+/*-");

	ТокеныШаблон = ЗначенияВМассив(Токен("Неизвестный", "+/*-"));
	ПроверитьРавенствоМассивовТокенов(ТокеныШаблон, Токены);
КонецПроцедуры

Процедура Тест_ЛА_ИдентификаторыИНеизвестныеТокены() Экспорт
	Токены = СоздатьАнализатор().ЛексическийАнализ("МойТест+Rr/И*-_Бора_");

	ТокеныШаблон = ЗначенияВМассив(
		Токен("Идентификатор", "МойТест"), Токен("Неизвестный", "+"), Токен("Идентификатор", "Rr"), Токен(
		"Неизвестный", "/"), Токен("Идентификатор", "И"), Токен("Неизвестный", "*-"), Токен("Идентификатор", "_Бора_"));
	ПроверитьРавенствоМассивовТокенов(ТокеныШаблон, Токены);
КонецПроцедуры

Процедура Тест_ЛА_ВызовФункции() Экспорт
	Токены = СоздатьАнализатор().ЛексическийАнализ("ЭтотОбъект._ВызватьМоюФункцию(Параметр1,Параметр2);");

	ТокеныШаблон = ЗначенияВМассив(
		Токен("Идентификатор", "ЭтотОбъект"), Токен("Точка", "."), Токен("Идентификатор", "_ВызватьМоюФункцию"), Токен(
		"ЛеваяСкобка", "("), Токен("Идентификатор", "Параметр1"), Токен("Неизвестный", ","), Токен("Идентификатор",
		"Параметр2"), Токен("ПраваяСкобка", ")"), Токен("ТочкаСЗапятой", ";"));
	ПроверитьРавенствоМассивовТокенов(ТокеныШаблон, Токены);
КонецПроцедуры

#КонецОбласти //Тесты_ЛексическийАнализ

#Область Тесты_СинтаксическийАнализ

Процедура Тест_СА_ОдинПараметр() Экспорт
	Параметры = ЗначенияВМассив("Тест");

	Токены = ЗначенияВМассив(
		Токен("Идентификатор", "Тест"));

	ТокеныШаблон = ЗначенияВМассив(
		Токен("Параметр", "Тест"));

	СоздатьАнализатор().СинтаксическийАнализ(Токены, Параметры);
	ПроверитьРавенствоМассивовТокенов(ТокеныШаблон, Токены);
КонецПроцедуры

Процедура Тест_СА_ФункцияСИменемПараметра() Экспорт
	Параметры = ЗначенияВМассив("Тест");

	Токены = ЗначенияВМассив(
		Токен("Идентификатор", "Тест"), Токен("ЛеваяСкобка", "("), Токен("ПраваяСкобка", ")"));

	ТокеныШаблон = ЗначенияВМассив(
		Токен("Функция", "Тест"), Токен("ЛеваяСкобка", "("), Токен("ПраваяСкобка", ")"));

	СоздатьАнализатор().СинтаксическийАнализ(Токены, Параметры);
	ПроверитьРавенствоМассивовТокенов(ТокеныШаблон, Токены);
КонецПроцедуры

Процедура Тест_СА_ФункцияСПробеламиПередСкобками() Экспорт
	Параметры = Новый Массив;

	Токены = ЗначенияВМассив(
		Токен("Идентификатор", "Тест"), Токен("Пробелы", "  " + Символы.ПС), Токен("ЛеваяСкобка", "("), Токен(
		"ПраваяСкобка", ")"));

	ТокеныШаблон = ЗначенияВМассив(
		Токен("Функция", "Тест"), Токен("Пробелы", "  " + Символы.ПС), Токен("ЛеваяСкобка", "("), Токен("ПраваяСкобка",
		")"));

	СоздатьАнализатор().СинтаксическийАнализ(Токены, Параметры);
	ПроверитьРавенствоМассивовТокенов(ТокеныШаблон, Токены);
КонецПроцедуры

Процедура Тест_СА_ПараметрСПолем() Экспорт
	Параметры = ЗначенияВМассив("Параметр");

	Токены = ЗначенияВМассив(
		Токен("Идентификатор", "Параметр"), Токен("Точка", "."), Токен("Пробелы", "  "), Токен("Идентификатор", "Поле"));

	ТокеныШаблон = ЗначенияВМассив(
		Токен("Параметр", "Параметр"), Токен("Точка", "."), Токен("Пробелы", "  "), Токен("Поле", "Поле"));

	СоздатьАнализатор().СинтаксическийАнализ(Токены, Параметры);
	ПроверитьРавенствоМассивовТокенов(ТокеныШаблон, Токены);
КонецПроцедуры

Процедура Тест_СА_ЛокальнаяПеременная() Экспорт
	Параметры = Новый Массив;

	Токены = ЗначенияВМассив(
		Токен("Идентификатор", "П"), Токен("Пробелы", " "), Токен("Равно", "="), Токен("Пробелы", " "), Токен(
		"Неизвестный", "1"));

	ТокеныШаблон = ЗначенияВМассив(
		Токен("Переменная", "П"), Токен("Пробелы", " "), Токен("Равно", "="), Токен("Пробелы", " "), Токен(
		"Неизвестный", "1"));

	СоздатьАнализатор().СинтаксическийАнализ(Токены, Параметры);
	ПроверитьРавенствоМассивовТокенов(ТокеныШаблон, Токены);
КонецПроцедуры

Процедура Тест_СА_ЛокальнаяПеременнаяСПроверкойНаРавенство() Экспорт
	Параметры = Новый Массив;

	Токены = ЗначенияВМассив(
		Токен("Идентификатор", "П"), Токен("Равно", "="), Токен("Идентификатор", "Р"), Токен("Равно", "="), Токен(
		"Неизвестный", "1"));

	ТокеныШаблон = ЗначенияВМассив(
		Токен("Переменная", "П"), Токен("Равно", "="), Токен("Идентификатор", "Р"), Токен("Равно", "="), Токен(
		"Неизвестный", "1"));

	СоздатьАнализатор().СинтаксическийАнализ(Токены, Параметры);
	ПроверитьРавенствоМассивовТокенов(ТокеныШаблон, Токены);
КонецПроцедуры

Процедура Тест_СА_ДвеЛокальныеПеременные() Экспорт
	Параметры = Новый Массив;

	Токены = ЗначенияВМассив(
		Токен("Идентификатор", "П"), Токен("Равно", "="), Токен("Неизвестный", "1"), Токен("ТочкаСЗапятой", ";"), Токен(
		"Идентификатор", "Р"), Токен("Равно", "="), Токен("Идентификатор", "П"));

	ТокеныШаблон = ЗначенияВМассив(
		Токен("Переменная", "П"), Токен("Равно", "="), Токен("Неизвестный", "1"), Токен("ТочкаСЗапятой", ";"), Токен(
		"Переменная", "Р"), Токен("Равно", "="), Токен("Переменная", "П"));

	СоздатьАнализатор().СинтаксическийАнализ(Токены, Параметры);
	ПроверитьРавенствоМассивовТокенов(ТокеныШаблон, Токены);
КонецПроцедуры

Процедура Тест_СА_КлючевыеСлова() Экспорт
	КлючевыеСлова = Новый Массив;
	КлючевыеСлова.Добавить("Новый");
	КлючевыеСлова.Добавить("Неопределено");
	КлючевыеСлова.Добавить("Null");
	КлючевыеСлова.Добавить("Истина");
	КлючевыеСлова.Добавить("Ложь");
	КлючевыеСлова.Добавить("И");
	КлючевыеСлова.Добавить("Или");
	КлючевыеСлова.Добавить("Не");
	КлючевыеСлова.Добавить("Если");
	КлючевыеСлова.Добавить("Тогда");
	КлючевыеСлова.Добавить("ИначеЕсли");
	КлючевыеСлова.Добавить("Иначе");
	КлючевыеСлова.Добавить("КонецЕсли");
	КлючевыеСлова.Добавить("Пока");
	КлючевыеСлова.Добавить("Для");
	КлючевыеСлова.Добавить("По");
	КлючевыеСлова.Добавить("Каждого");
	КлючевыеСлова.Добавить("Цикл");
	КлючевыеСлова.Добавить("Прервать");
	КлючевыеСлова.Добавить("Продолжить");
	КлючевыеСлова.Добавить("КонецЦикла");
	КлючевыеСлова.Добавить("ВызватьИсключение");

	Токены = СоздатьМассивТокеновОдинакогоТипа(КлючевыеСлова, "Идентификатор");
	ТокеныШаблон = СоздатьМассивТокеновОдинакогоТипа(КлючевыеСлова, "КлючевоеСлово");

	СоздатьАнализатор().СинтаксическийАнализ(Токены, Новый Массив);
	ПроверитьРавенствоМассивовТокенов(ТокеныШаблон, Токены);
КонецПроцедуры

Процедура Тест_СА_ПеременнаяВЕсли() Экспорт
	Параметры = Новый Массив;

	Токены = ЗначенияВМассив(
		Токен("Идентификатор", "Если"), Токен("Пробелы", " "), Токен("Идентификатор", "Истина"), Токен("Пробелы", " "),
		Токен("Идентификатор", "Тогда"), Токен("Пробелы", " "), Токен("Идентификатор", "Р"), Токен("Равно", "="), Токен(
		"Неизвестный", "1"));
	ДобавитьЗначенияВМассив(Токены, Токен("ТочкаСЗапятой", ";"), Токен("Пробелы", " "), Токен("Идентификатор",
		"КонецЕсли"), Токен("ТочкаСЗапятой", ";"), );

	ТокеныШаблон = ЗначенияВМассив(
		Токен("КлючевоеСлово", "Если"), Токен("Пробелы", " "), Токен("КлючевоеСлово", "Истина"), Токен("Пробелы", " "),
		Токен("КлючевоеСлово", "Тогда"), Токен("Пробелы", " "), Токен("Переменная", "Р"), Токен("Равно", "="), Токен(
		"Неизвестный", "1"));
	ДобавитьЗначенияВМассив(ТокеныШаблон, Токен("ТочкаСЗапятой", ";"), Токен("Пробелы", " "), Токен("КлючевоеСлово",
		"КонецЕсли"), Токен("ТочкаСЗапятой", ";"), );

	СоздатьАнализатор().СинтаксическийАнализ(Токены, Параметры);
	ПроверитьРавенствоМассивовТокенов(ТокеныШаблон, Токены);
КонецПроцедуры

Процедура Тест_СА_ПеременныеВЕслиИначе() Экспорт
	Параметры = Новый Массив;

	Токены = ЗначенияВМассив(
		Токен("Идентификатор", "Если"), Токен("Пробелы", " "), Токен("Идентификатор", "Истина"), Токен("Пробелы", " "),
		Токен("Идентификатор", "Тогда"), Токен("Пробелы", " "), Токен("Идентификатор", "Р"), Токен("Равно", "="), Токен(
		"Неизвестный", "1"));
	ДобавитьЗначенияВМассив(Токены, Токен("Пробелы", " "), Токен("Идентификатор", "Иначе"), Токен("Пробелы", " "),
		Токен("Идентификатор", "П"), Токен("Равно", "="), Токен("Неизвестный", "2"), Токен("Пробелы", " "), Токен(
		"Идентификатор", "КонецЕсли"));

	ТокеныШаблон = ЗначенияВМассив(
		Токен("КлючевоеСлово", "Если"), Токен("Пробелы", " "), Токен("КлючевоеСлово", "Истина"), Токен("Пробелы", " "),
		Токен("КлючевоеСлово", "Тогда"), Токен("Пробелы", " "), Токен("Переменная", "Р"), Токен("Равно", "="), Токен(
		"Неизвестный", "1"));
	ДобавитьЗначенияВМассив(ТокеныШаблон, Токен("Пробелы", " "), Токен("КлючевоеСлово", "Иначе"), Токен("Пробелы", " "),
		Токен("Переменная", "П"), Токен("Равно", "="), Токен("Неизвестный", "2"), Токен("Пробелы", " "), Токен(
		"КлючевоеСлово", "КонецЕсли"));

	СоздатьАнализатор().СинтаксическийАнализ(Токены, Параметры);
	ПроверитьРавенствоМассивовТокенов(ТокеныШаблон, Токены);
КонецПроцедуры

Процедура Тест_СА_ПеременнаяВЦикле() Экспорт
	Параметры = Новый Массив;

	Токены = ЗначенияВМассив(
		Токен("Идентификатор", "Пока"), Токен("Пробелы", " "), Токен("Идентификатор", "Индекс"), Токен("Равно", "="),
		Токен("Неизвестный", "1"), Токен("Пробелы", " "), Токен("Идентификатор", "Цикл"), Токен("Пробелы", " "));
	ДобавитьЗначенияВМассив(Токены, Токен("Идентификатор", "Р"), Токен("Равно", "="), Токен("Неизвестный", "1"), Токен(
		"ТочкаСЗапятой", ";"), Токен("Пробелы", " "), Токен("Идентификатор", "КонецЦикла"));

	ТокеныШаблон = ЗначенияВМассив(
		Токен("КлючевоеСлово", "Пока"), Токен("Пробелы", " "), Токен("Идентификатор", "Индекс"), Токен("Равно", "="),
		Токен("Неизвестный", "1"), Токен("Пробелы", " "), Токен("КлючевоеСлово", "Цикл"), Токен("Пробелы", " "));
	ДобавитьЗначенияВМассив(ТокеныШаблон, Токен("Переменная", "Р"), Токен("Равно", "="), Токен("Неизвестный", "1"),
		Токен("ТочкаСЗапятой", ";"), Токен("Пробелы", " "), Токен("КлючевоеСлово", "КонецЦикла"));

	СоздатьАнализатор().СинтаксическийАнализ(Токены, Параметры);
	ПроверитьРавенствоМассивовТокенов(ТокеныШаблон, Токены);
КонецПроцедуры

Процедура Тест_СА_ПеременнаяВДля() Экспорт
	Параметры = Новый Массив;

	Токены = ЗначенияВМассив(
		Токен("Идентификатор", "Для"), Токен("Пробелы", " "), Токен("Идентификатор", "Индекс"), Токен("Равно", "="),
		Токен("Неизвестный", "1"), Токен("Пробелы", " "), Токен("Идентификатор", "По"), Токен("Пробелы", " "));
	ДобавитьЗначенияВМассив(Токены, Токен("Неизвестный", "10"), Токен("Пробелы", " "), Токен("Идентификатор", "Цикл"),
		Токен("ТочкаСЗапятой", ";"), Токен("Пробелы", " "), Токен("Идентификатор", "КонецЦикла"));

	ТокеныШаблон = ЗначенияВМассив(
		Токен("КлючевоеСлово", "Для"), Токен("Пробелы", " "), Токен("Переменная", "Индекс"), Токен("Равно", "="), Токен(
		"Неизвестный", "1"), Токен("Пробелы", " "), Токен("КлючевоеСлово", "По"), Токен("Пробелы", " "));
	ДобавитьЗначенияВМассив(ТокеныШаблон, Токен("Неизвестный", "10"), Токен("Пробелы", " "), Токен("КлючевоеСлово",
		"Цикл"), Токен("ТочкаСЗапятой", ";"), Токен("Пробелы", " "), Токен("КлючевоеСлово", "КонецЦикла"));

	СоздатьАнализатор().СинтаксическийАнализ(Токены, Параметры);
	ПроверитьРавенствоМассивовТокенов(ТокеныШаблон, Токены);
КонецПроцедуры

#КонецОбласти //Тесты_СинтаксическийАнализ

#Область Тесты_ДобавитьРезультат

Процедура Тест_ДобавитьПолучениеРезультата_ОдноВыражение() Экспорт
	Код = "2 + 2";
	ПеременнаяРезультат = "__Лямбда_Результат";

	КодШаблон = "__Лямбда_Результат=2 + 2";
	КодРезультат = СоздатьАнализатор().ДобавитьПолучениеРезультата(Код, ПеременнаяРезультат);
	Утверждения.ПроверитьРавенство(КодШаблон, КодРезультат);
КонецПроцедуры

Процедура Тест_ДобавитьПолучениеРезультата_ДваВыражения() Экспорт
	Код = "Тест = 2 + 2;Тест + 1";
	ПеременнаяРезультат = "__Лямбда_Результат";

	КодШаблон = "Тест = 2 + 2;__Лямбда_Результат=Тест + 1";
	КодРезультат = СоздатьАнализатор().ДобавитьПолучениеРезультата(Код, ПеременнаяРезультат);
	Утверждения.ПроверитьРавенство(КодШаблон, КодРезультат);
КонецПроцедуры

Процедура Тест_ДобавитьПолучениеРезультата_ТочкаЗапятаяВКонце() Экспорт
	Код = "2 + 2; ";
	ПеременнаяРезультат = "__Лямбда_Результат";

	КодШаблон = "__Лямбда_Результат=2 + 2; ";
	КодРезультат = СоздатьАнализатор().ДобавитьПолучениеРезультата(Код, ПеременнаяРезультат);
	Утверждения.ПроверитьРавенство(КодШаблон, КодРезультат);
КонецПроцедуры

Процедура Тест_ДобавитьПолучениеРезультата_ОднаПеременная() Экспорт
	Код = "П";
	ПеременнаяРезультат = "__Лямбда_Результат";

	КодШаблон = "__Лямбда_Результат=П";
	КодРезультат = СоздатьАнализатор().ДобавитьПолучениеРезультата(Код, ПеременнаяРезультат);
	Утверждения.ПроверитьРавенство(КодШаблон, КодРезультат);
КонецПроцедуры

#КонецОбласти //Тесты_ДобавитьРезультат

#Область Тесты_ПолучитьКодДляВстраивания

Процедура Тесты_ПолучитьКодДляВстраивания_ОдноВыражение() Экспорт
	Код = "2 + 2;";

	КодШаблон = "__Условие=2 + 2;";
	КодРезультат = СоздатьАнализатор().ПодготовитьКодДляВстраивания(Код, Новый Структура, , "__Условие");
	Утверждения.ПроверитьРавенство(КодШаблон, КодРезультат);
КонецПроцедуры

Процедура Тесты_ПолучитьКодДляВстраивания_ОдноВыражениеБезТочкиСЗапятой() Экспорт
	Код = "2 + 2";

	КодШаблон = "__Условие=2 + 2;";
	КодРезультат = СоздатьАнализатор().ПодготовитьКодДляВстраивания(Код, Новый Структура, , "__Условие");
	Утверждения.ПроверитьРавенство(КодШаблон, КодРезультат);
КонецПроцедуры

Процедура Тесты_ПолучитьКодДляВстраивания_ВыражениеОдинПараметр() Экспорт
	Код = "П1 + 2";

	КодШаблон = "Результат=Перем_П1 + 2;";
	ПодстановкаПараметров = Новый Структура("П1", "Перем_П1");
	КодРезультат = СоздатьАнализатор().ПодготовитьКодДляВстраивания(Код, ПодстановкаПараметров, , "Результат");
	Утверждения.ПроверитьРавенство(КодШаблон, КодРезультат);
КонецПроцедуры

Процедура Тесты_ПолучитьКодДляВстраивания_ВыражениеСПараметрами() Экспорт
	Код = "П*2 + Р.П(2*П)";
	ПодстановкаПараметров = Новый Структура("П, Р", "Замена_П", "Замена_Р");

	КодШаблон = "__Условие=Замена_П*2 + Замена_Р.П(2*Замена_П);";
	КодРезультат = СоздатьАнализатор().ПодготовитьКодДляВстраивания(Код, ПодстановкаПараметров, , "__Условие");
	Утверждения.ПроверитьРавенство(КодШаблон, КодРезультат);
КонецПроцедуры

Процедура Тесты_ПолучитьКодДляВстраивания_ВыражениеСПеременными() Экспорт
	Код = "Т=П+Р; Т";
	Замены = Новый Структура("П, Р", "Замена_П", "Замена_Р");

	КодШаблон = "__Перем_Т=Замена_П+Замена_Р; __Условие=__Перем_Т;";
	КодРезультат = СоздатьАнализатор().ПодготовитьКодДляВстраивания(Код, Замены, "__Перем", "__Условие");
	Утверждения.ПроверитьРавенство(КодШаблон, КодРезультат);
КонецПроцедуры

Процедура Тесты_ПолучитьКодДляВстраивания_СКонтекстом() Экспорт
	Код = "П=Р+1";
	Замены = Новый Структура("П,Р", "__Контекст.Замена_П", "__Контекст.Замена_Р");

	КодШаблон = "__Контекст.Замена_П=__Контекст.Замена_Р+1;";
	КодРезультат = СоздатьАнализатор().ПодготовитьКодДляВстраивания(Код, Замены, "__Перем");
	Утверждения.ПроверитьРавенство(КодШаблон, КодРезультат);
КонецПроцедуры

Процедура Тесты_ПолучитьКодДляВстраивания_ПеременнаяВЕсли() Экспорт
	Код = "
		  |Если Э > 1 Тогда
		  |	Р = Истина;
		  |Иначе
		  |	Р = Ложь;
		  |КонецЕсли;";

	КодШаблон = "
				|Если __Э > 1 Тогда
				|	__Перем_Р = Истина;
				|Иначе
				|	__Перем_Р = Ложь;
				|КонецЕсли;";
	Замены = Новый Структура("Э", "__Э");
	КодРезультат = СоздатьАнализатор().ПодготовитьКодДляВстраивания(Код, Замены, "__Перем");

	Утверждения.ПроверитьРавенство(КодШаблон, КодРезультат);
КонецПроцедуры

Процедура Тесты_ПолучитьКодДляВстраивания_ПеременнаяВоВложенномЕсли() Экспорт
	Код = "
		  |Если Э > 1 Тогда
		  |	Если Э < 100 Тогда
		  |		Р = Истина;
		  |	КонецЕсли;
		  |Иначе
		  |	Для Индекс = 1 По 100 Цикл
		  |		Р = Ложь;
		  |	КонецЦикла;
		  |КонецЕсли;
		  |Р";

	КодШаблон = "
				|Если __Э > 1 Тогда
				|	Если __Э < 100 Тогда
				|		__Перем_Р = Истина;
				|	КонецЕсли;
				|Иначе
				|	Для __Перем_Индекс = 1 По 100 Цикл
				|		__Перем_Р = Ложь;
				|	КонецЦикла;
				|КонецЕсли;
				|__Условие=__Перем_Р;";
	Замены = Новый Структура("Э", "__Э");
	КодРезультат = СоздатьАнализатор().ПодготовитьКодДляВстраивания(Код, Замены, "__Перем", "__Условие");

	Утверждения.ПроверитьРавенство(КодШаблон, КодРезультат);
КонецПроцедуры

#КонецОбласти //Тесты_ПолучитьКодДляВстраивания

#Область Вспомогательные

Функция СоздатьАнализатор()
	Возврат Обработки.А_АнализаторКода.Создать();
КонецФункции

Процедура ПроверитьРавенствоМассивовТокенов(МассивШаблон, МассивПроверяемый)
	Утверждения.ПроверитьРавенство(МассивШаблон.Количество(), МассивПроверяемый.Количество(),
		"Количество токенов отличается!");
	Для Индекс = 0 По МассивШаблон.ВГраница() Цикл
		ТокенШаблон = МассивШаблон[Индекс];
		ТокенПроверяемый = МассивПроверяемый[Индекс];

		Утверждения.ПроверитьРавенство(ТокенШаблон.Тип, ТокенПроверяемый.Тип, "Токен #" + Индекс);
		Утверждения.ПроверитьРавенство(ТокенШаблон.Значение, ТокенПроверяемый.Значение, "Токен #" + Индекс);
	КонецЦикла;
КонецПроцедуры

Функция ЗначенияВМассив(Значение1, Значение2 = Неопределено, Значение3 = Неопределено, Значение4 = Неопределено,
	Значение5 = Неопределено, Значение6 = Неопределено, Значение7 = Неопределено, Значение8 = Неопределено,
	Значение9 = Неопределено)
	Результат = Новый Массив;
	Результат.Добавить(Значение1);
	Если Значение2 <> Неопределено Тогда
		Результат.Добавить(Значение2);
	КонецЕсли;
	Если Значение3 <> Неопределено Тогда
		Результат.Добавить(Значение3);
	КонецЕсли;
	Если Значение4 <> Неопределено Тогда
		Результат.Добавить(Значение4);
	КонецЕсли;
	Если Значение5 <> Неопределено Тогда
		Результат.Добавить(Значение5);
	КонецЕсли;
	Если Значение6 <> Неопределено Тогда
		Результат.Добавить(Значение6);
	КонецЕсли;
	Если Значение7 <> Неопределено Тогда
		Результат.Добавить(Значение7);
	КонецЕсли;
	Если Значение8 <> Неопределено Тогда
		Результат.Добавить(Значение8);
	КонецЕсли;
	Если Значение9 <> Неопределено Тогда
		Результат.Добавить(Значение9);
	КонецЕсли;

	Возврат Результат;
КонецФункции

Процедура ДобавитьЗначенияВМассив(Массив, Значение1, Значение2 = Неопределено, Значение3 = Неопределено,
	Значение4 = Неопределено, Значение5 = Неопределено, Значение6 = Неопределено, Значение7 = Неопределено,
	Значение8 = Неопределено, Значение9 = Неопределено)
	Массив.Добавить(Значение1);
	Если Значение2 <> Неопределено Тогда
		Массив.Добавить(Значение2);
	КонецЕсли;
	Если Значение3 <> Неопределено Тогда
		Массив.Добавить(Значение3);
	КонецЕсли;
	Если Значение4 <> Неопределено Тогда
		Массив.Добавить(Значение4);
	КонецЕсли;
	Если Значение5 <> Неопределено Тогда
		Массив.Добавить(Значение5);
	КонецЕсли;
	Если Значение6 <> Неопределено Тогда
		Массив.Добавить(Значение6);
	КонецЕсли;
	Если Значение7 <> Неопределено Тогда
		Массив.Добавить(Значение7);
	КонецЕсли;
	Если Значение8 <> Неопределено Тогда
		Массив.Добавить(Значение8);
	КонецЕсли;
	Если Значение9 <> Неопределено Тогда
		Массив.Добавить(Значение9);
	КонецЕсли;
КонецПроцедуры

Функция Токен(ТипСтрока, Значение)
	Токен = Новый Структура;
	Токен.Вставить("Тип", СоответствиеТипов.Получить(ТипСтрока));
	Токен.Вставить("Значение", Значение);

	Возврат Токен;
КонецФункции

Функция СоздатьМассивТокеновОдинакогоТипа(КлючевыеСлова, Тип)
	Токены = Новый Массив;
	Для Каждого КлючевоеСлово Из КлючевыеСлова Цикл
		Токены.Добавить(Токен(Тип, КлючевоеСлово));
	КонецЦикла;

	Возврат Токены;
КонецФункции

#КонецОбласти //Вспомогательные
