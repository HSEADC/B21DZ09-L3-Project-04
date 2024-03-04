const tags = document.querySelector('.C_TasksTypes'),
  items = document.querySelectorAll('.A_AnswerCard'),
  allItems = document.querySelectorAll('.O_CardNewTask'),
  listItems = document.querySelectorAll('.A_TaskType small')

// фильтр в профиле
function filter() {
  tags.addEventListener('click', event => {
    const targetId = event.target.dataset.id
    const target = event.target

    // отображение активной категории
    // listItems.forEach(listItem => listItem.classList.remove('active'))
    // target.classList.add('active')

    switch (targetId) {
      // кнопка все
      // case 'all':
      //   getItems('A_AnswerCard')

      case 'F':
        getItems(targetId)
        break

      case 'S':
        getItems(targetId)
        break

      case 'C':
        getItems(targetId)
        break

      case 'R':
        getItems(targetId)
        break

      case 'T':
        getItems(targetId)
        break

    }
  })
}

filter()

function getItems(className) {
  items.forEach(item => {
    if (item.classList.contains(className)) {
      item.style.display = 'block'
    } else {
      item.style.display = 'none'
    }
  })
}


// фильтр во всех заданиях
function allFilter() {
  tags.addEventListener('click', event => {
    const targetId = event.target.dataset.id
    const target = event.target

    switch (targetId) {
      case 'F':
        getAllItems(targetId)
        break

      case 'S':
        getAllItems(targetId)
        break

      case 'C':
        getAllItems(targetId)
        break

      case 'R':
        getAllItems(targetId)
        break

      case 'T':
        getAllItems(targetId)
        break

    }
  })
}

allFilter()

function getAllItems(className) {
  allItems.forEach(item => {
    if (item.classList.contains(className)) {
      item.style.display = 'flex'
    } else {
      item.style.display = 'none'
    }
  })
}