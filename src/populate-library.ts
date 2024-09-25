import { PrismaClient } from "@prisma/client";

const client = new PrismaClient()

async function main() {
  const book = await client.book.create({
    data: {
      title: "Kafka on the Shore",
      ISBN: '0-4973-1219-0',
      author: {
        create: 
          {
          name: 'Haruki Murakami',
          biography: 'a guy from Japan'
        }
      },
      genres: {
        create: [
          {name: 'Fiction'},
          {name: 'Magical-Realism'}
        ]
      },
      member: {
        create:
          {
          name: 'Bob',
          email: 'bob@burgers.com',
          address: '123 Fake Street'
        }
      }
    },
  })
}

main()
