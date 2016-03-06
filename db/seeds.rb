d# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

form = LoiForm.create({
  name: "Hope Cancer Fund",
  email: "HCF@mailgun.com"
})
Answer.create({
  loi_form_id: form.id,
  question: "Address",
  answer: "209 E. Washington Avenue, Commonwealth Commerce Center Suite 301, Jackson, Michigan 49201"
})
Answer.create({
  loi_form_id: form.id,
  question: "Phone",
  answer: "312-555-3556"
  })
Answer.create({
  loi_form_id: form.id,
  question: "Website",
  answer: "www.cancerfund.org"
  })
Answer.create({
  loi_form_id: form.id,
  question: "Executive Director",
  answer: "Arnold Palmer"
  })
Answer.create({
  loi_form_id: form.id,
  question: "Proposal Contact",
  answer: "Jay Adams"
  })
Answer.create({
  loi_form_id: form.id,
  question: "Employees",
  answer: "32"
  })
Answer.create({
  loi_form_id: form.id,
  question: "Volunteers",
  answer: "234"
  })
Answer.create({
  loi_form_id: form.id,
  question: "Active Board Members",
  answer: "6"
  })
Answer.create({
  loi_form_id: form.id,
  question: "Total Annual Budget",
  answer: "$125,000"
  })

form = LoiForm.create({
  name: "Caring for Our Children Foundation",
  email: "jane@CFOCF.com"
})
Answer.create({
  loi_form_id: form.id,
  question: "Address",
  answer: "THE VOICE OF A CHILD, PO BOX 922 Marysville, WA 98270"
})
Answer.create({
  loi_form_id: form.id,
  question: "Phone",
  answer: "425-374-2635"
  })
Answer.create({
  loi_form_id: form.id,
  question: "Website",
  answer: "http://www.caringforourchildrenfoundation.org"
  })
Answer.create({
  loi_form_id: form.id,
  question: "Executive Director",
  answer: "Janice Bryant-Day"
  })
Answer.create({
  loi_form_id: form.id,
  question: "Proposal Contact",
  answer: "Jane Samson"
  })
Answer.create({
  loi_form_id: form.id,
  question: "Employees",
  answer: "41"
  })
Answer.create({
  loi_form_id: form.id,
  question: "Volunteers",
  answer: "180"
  })
Answer.create({
  loi_form_id: form.id,
  question: "Active Board Members",
  answer: "10"
  })
Answer.create({
  loi_form_id: form.id,
  question: "Total Annual Budget",
  answer: "$193,000"
  })

form = LoiForm.create({
  name: "Survivors and Victims Empowered",
  email: "alex.walker@gmail.com"
})
Answer.create({
  loi_form_id: form.id,
  question: "Address",
  answer: "38 Doe Run Rd, Ste 250, MANHEIM PA 17545"
})
Answer.create({
  loi_form_id: form.id,
  question: "Phone",
  answer: "717-665-0006"
  })
Answer.create({
  loi_form_id: form.id,
  question: "Website",
  answer: "http://www.childprotectionprogram.org"
  })
Answer.create({
  loi_form_id: form.id,
  question: "Executive Director",
  answer: "Carrie O'Brien"
  })
Answer.create({
  loi_form_id: form.id,
  question: "Proposal Contact",
  answer: "Alex Walker"
  })
Answer.create({
  loi_form_id: form.id,
  question: "Employees",
  answer: "65"
  })
Answer.create({
  loi_form_id: form.id,
  question: "Volunteers",
  answer: "137"
  })
Answer.create({
  loi_form_id: form.id,
  question: "Active Board Members",
  answer: "3"
  })
Answer.create({
  loi_form_id: form.id,
  question: "Total Annual Budget",
  answer: "$221,298"
  })