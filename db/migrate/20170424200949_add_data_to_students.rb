class AddDataToStudents < ActiveRecord::Migration[5.0]
  def up
    Student.create(name: 'Nika', last_name: 'Giorgadze', school_id: 2)
    Student.create(name: 'Ana', last_name: 'Gabashvili', school_id: 2)
    Student.create(name: 'Salome', last_name: 'Eradze', school_id: 3)
    Student.create(name: 'Zura', last_name: 'Esiava', school_id: 3)
    Student.create(name: 'Zviadi', last_name: 'Sanaia', school_id: 4)
    Student.create(name: 'Tornike', last_name: 'Loladze', school_id: 5)
    Student.create(name: 'Natia', last_name: 'Shvangiradze', school_id: 5)
    Student.create(name: 'Nata', last_name: 'Chikhladze', school_id: 6)
    Student.create(name: 'Beka', last_name: 'Meskhi', school_id: 6)
    Student.create(name: 'Gia', last_name: 'Toronjadze', school_id: 6)
    Student.create(name: 'Irakli', last_name: 'Lomaia', school_id: 6)
  end

  def down
    Student.delete_all
  end
end
