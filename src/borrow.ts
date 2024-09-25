import { PrismaClient } from "@prisma/client";

const client = new PrismaClient()

async function main() {
  const book = await client.member.create({
    data: {
      name: "Cece Pizza",
      email: 'cece@pizza.com',
      address: "Somewhere in Bushwick",
      books: {
        create: {
          title: 'The Denial of Death',
          ISBN: 'bob@burgers.com',
          author: {
            create: 
              {
              name: 'Haruki Murakami',
              biography: 'a guy from Japan'
            },
        },
        genres: {
          create: [
            {name: 'Philosophy'},
            {name: 'Existentialism'}
          ]
        },
      },
    },
  }
})}

main()