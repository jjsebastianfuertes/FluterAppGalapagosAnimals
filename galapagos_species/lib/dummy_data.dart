import './models/animal.dart';
import './models/category.dart';

const ISLAND_CATEGORIES = const [
  Category(
    id: 'c1',
    title: 'Floreana',
    imageUrl: 'https://www.cruisemapper.com/images/ports/2314-1187b2a70c5.jpg',
  ),
  Category(
    id: 'c2',
    title: 'Isabela',
    imageUrl:
        'https://playasonline.ec/wp-content/uploads/2019/04/isla-isabela-los-tuneles-galapagos.jpg',
  ),
  Category(
    id: 'c3',
    title: 'San Cristobal',
    imageUrl:
        'https://naturegalapagos.com/wp-content/uploads/2017/02/san-cristobal-galapagos-package-tour-1140x530.jpg',
  ),
  Category(
    id: 'c4',
    title: 'Santa Cruz',
    imageUrl:
        'https://i0.wp.com/www.drinkteatravel.com/wp-content/uploads/Ecuador-Galapagos-Santa-Cruz-0190.jpg?fit=1400%2C786&ssl=1',
  ),
];

const ANIMAL_DATA = const [
  Animal(
    id: 'a1',
    categories: ['c4'],
    title: 'Tortuga gigante de Floreana',
    scintificName: 'Chelonoidis nigra',
    imageUrl:
        'https://www.eltelegrafo.com.ec/media/k2/items/cache/a3ec126069d7b8697280a18fca374461_XL.jpg',
    description:
        'es una especie extinta de tortuga gigante, una de las 10 especies originarias de las islas Galápagos (Ecuador). Concretamente esta especie era endémica de la isla Floreana. Fue descrita por primera vez por los zoólogos franceses Jean René Constant Quoy y Joseph Paul Gaimard en el año 1824.',
    food: ['Comida que come'],
    predators: ['Rats', 'Pigs', 'Ants', 'More'],
    status: Status.Extinct,
    isEndemic: true,
    isMarine: false,
    isSummer: true,
  ),
  Animal(
    id: 'a2',
    categories: ['c4', 'c3'],
    title: 'Tortuga gigante de Floreana',
    scintificName: 'Chelonoidis nigra',
    imageUrl:
        'https://www.islandconservation.org/wp-content/uploads/2015/08/Island-conservation-floreana-galapagos-1.jpg',
    description:
        'es una especie extinta de tortuga gigante, una de las 10 especies originarias de las islas Galápagos (Ecuador). Concretamente esta especie era endémica de la isla Floreana. Fue descrita por primera vez por los zoólogos franceses Jean René Constant Quoy y Joseph Paul Gaimard en el año 1824.',
    food: ['Comida que come'],
    predators: ['None'],
    status: Status.Vulnerable,
    isEndemic: true,
    isMarine: true,
    isSummer: true,
  ),
];
