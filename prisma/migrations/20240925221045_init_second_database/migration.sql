/*
  Warnings:

  - You are about to drop the column `authorId` on the `Book` table. All the data in the column will be lost.
  - You are about to drop the `Author` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Member` table. If the table is not empty, all the data it contains will be lost.
  - Added the required column `personwhowrotethebookId` to the `Book` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "Book" DROP CONSTRAINT "Book_authorId_fkey";

-- DropForeignKey
ALTER TABLE "Book" DROP CONSTRAINT "Book_memberId_fkey";

-- AlterTable
ALTER TABLE "Book" DROP COLUMN "authorId",
ADD COLUMN     "personwhowrotethebookId" TEXT NOT NULL;

-- DropTable
DROP TABLE "Author";

-- DropTable
DROP TABLE "Member";

-- CreateTable
CREATE TABLE "PersonWhoWroteTheBook" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "biography" TEXT,

    CONSTRAINT "PersonWhoWroteTheBook_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Borrower" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "address" TEXT,

    CONSTRAINT "Borrower_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "Borrower_email_key" ON "Borrower"("email");

-- AddForeignKey
ALTER TABLE "Book" ADD CONSTRAINT "Book_personwhowrotethebookId_fkey" FOREIGN KEY ("personwhowrotethebookId") REFERENCES "PersonWhoWroteTheBook"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Book" ADD CONSTRAINT "Book_memberId_fkey" FOREIGN KEY ("memberId") REFERENCES "Borrower"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
