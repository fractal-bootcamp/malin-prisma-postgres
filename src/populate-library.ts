import { PrismaClient } from "@prisma/client";

const client = new PrismaClient()

async function main() {
  const book = await client.book.create({
    data: {
      title: "IQ84",
      ISBN: '0-4973-1219-1',
      author: {
        connect: 
          {
          id: 'cm1ifonz50001v06li4l44bxq',
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
          email: 'sally@burgers.com',
          address: '123 Fake Street'
        }
      }
    },
  })
}

main()
