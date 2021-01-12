# ReactorKit

> ReactorKit - это платформа для реактивной и однонаправленной архитектуры приложений Swift. ReactorKit - это комбинация программирования Flux и RX. Действия пользователя и состояния просмотра доставляются на каждый уровень через наблюдаемые потоки. Эти потоки являются однонаправленными, поэтому вид может излучать только Action's, а реактор может только излучать State's.

![Image for post](https://miro.medium.com/max/3536/0*GR_fyswCbSZmS-15)

A **View** отображает данные. Контроллер представления и ячейка рассматриваются как представление. Представление связывает вводимые пользователем данные с потоком действий и привязывает состояния представления к каждому компоненту пользовательского интерфейса. На уровне представления нет бизнес-логики. Представление просто определяет, как сопоставить поток действий и поток состояний.

**Reactor** - это не зависящий от пользовательского интерфейса уровень, который управляет состоянием представления. Основная роль реактора - отделить поток управления от обзора. Каждое представление имеет соответствующий реактор и делегирует всю логику своему реактору. Реактор не зависит от представления, поэтому его можно легко протестировать. Чтобы определить реактор, следуйте протоколу Reactor. Этот протокол требует определения трех типов: Действие, Мутация и Состояние. Также требуется свойство с именем initialState.

Действие - это взаимодействие с пользователем, а состояние - это состояние просмотра. Мутация - это мост между действием и состоянием. Reactor преобразует поток действий в поток состояний в два этапа: mutate () и reduce ().

**mutate()** получает Action и генерирует Observable <Mutation>
Делать внутри валидацию данных. 

```swift
func mutate(action: Action) -> Observable<Mutation>
```

**reduce()** генерирует новое состояние из предыдущего состояния и мутации.
Этот метод - чистая функция. Он должен просто синхронно возвращать новое состояние.

```swift
func reduce(state: State, mutation: Mutation) -> State
```

```swift
func reduce(state: State, mutation: Mutation) -> State {
	var state = state  // create a copy of the old state
	switch mutation {
	case let .setFollowing(isFollowing):
	state.isFollowing = isFollowing  // manipulate the state, creating a new state
	return state  // return the new state
	}
}
```

Реализуйте эти методы для преобразования и объединения с другими наблюдаемыми потоками. 
Например, transform (mutation :) - лучшее место для объединения глобального потока событий с потоком мутаций.

```swift
class ProfileViewReactor: Reactor {
	// represent user actions
	enum Action {
    case refreshFollowingStatus(Int)
    case follow(Int)
	}
  // represent state changes
  enum Mutation {
    case setFollowing(Bool)
  }
  // represents the current view state
  struct State {
    var isFollowing: Bool = false
  }
	let initialState: State = State()
}
```

