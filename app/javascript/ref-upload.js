let ids = [
  'task_vector_font',
  'task_vector_regularity',
  'task_vector_shape',
  'task_texture_image',
];

let placeholders = [
  'Загрузить вектор шрифта',
  'Загрузить вектор закономерности',
  'Загрузить вектор формы',
  'Загрузить фото текстуры',
];

let taskTypes = document.querySelectorAll('.C_TaskTypes .A_TaskType');
let select = document.querySelector('#task_type');
let selectOptions = select.querySelectorAll('option');
let uploadFields = document.querySelectorAll('.C_UploadFields .W_UploadField');

function taskTypesInit() {
  for (let i = 0; i < taskTypes.length; i++) {
    let taskType = taskTypes[i];
    taskType.addEventListener('click', () => {
      categoryChange(i);
    });
  }
}

function categoryChange(i) {
  for (const taskType of taskTypes) {
    if (taskType !== this) {
      taskType.classList.add('inactive');
    }
  }

  for (let a = 0; a < uploadFields.length; a++) {
    if (a == i) {
      uploadFields[a].style.display = 'block';
    } else {
      uploadFields[a].style.display = 'none';
    }
  }
  taskTypes[i].classList.remove('inactive');
  selectOptions[i].selected = 'selected';
}

function placeholderChange() {
  for (let i = 0; i < ids.length; i++) {
    const id = ids[i];
    document.querySelector(`#${id}`).onchange = function () {
      const fileName = this.files[0]?.name;
      const label = document.querySelector(`label[for=${id}]`);
      label.innerText = fileName ?? placeholders[i];
    };
  }
}

document.addEventListener('DOMContentLoaded', () => {
  placeholderChange(), taskTypesInit();
});
