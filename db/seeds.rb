categories = {economy:                  'Экономика',
              urban_infrastructure:     'Городская Инфраструктура',
              architecture:             'Архитектура',
              public_service:           'Комунальное хозяйство',
              realty:                   'Недвижимость',
              regional_infrastructure:  'Областная инфраструктура',
              tarifs:                   'Тарифы',
              solution:                 'Общество',
              children:                 'Дети',
              animals:                  'Животные',
              selebrates:               'Праздники',
              funs:                     'Развлечения',
              accident:                 'Происшествия',
              criminal:                 'Криминал',
              migrants:                 'Мигранты',
              weather:                  'Погода',
              transport:                'Транспорт',
              subway:                   'Метрополитен',
              social_transport:         'Социальний транспорт',
              culture:                  'Культура',
              politics:                 'Политика' }
categories.each do | en_name, ru_name |
 Category.create( title: en_name, page_title: ru_name )
end
