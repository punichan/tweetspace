class Category < ActiveHash::Base
  self.data = [
    {id: 1, name: '寿司・魚料理'},
    {id: 2, name: '和食・日本料理'},
    {id: 3, name: 'ラーメン・麺類'},
    {id: 4, name: '丼もの・揚げ物'},
    {id: 5, name: 'お好み焼き・粉物'},
    {id: 6, name: 'アジア・エスニック'},
    {id: 7, name: '中華'},
    {id: 8, name: 'アメリカ料理'},
    {id: 9, name: 'アフリカ料理'},
    {id: 10, name: 'その他各国の料理'},
    {id: 11, name: '肉料理'},
    {id: 12, name: '焼き鳥・串料理'},
    {id: 13, name: '鍋'},
    {id: 14, name: '居酒屋・バー'},
    {id: 15, name: 'カフェ・スイーツ'},
    {id: 16, name: 'ファミレス・ファーストフード'},
    {id: 17, name: 'ビュッフェ・バイキング'},
    {id: 18, name: 'その他'},
  ]
end